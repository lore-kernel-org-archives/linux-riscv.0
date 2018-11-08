From: vincentc@andestech.com (Vincent Chen)
Date: Thu, 8 Nov 2018 10:43:13 +0800
Subject: [RFC 0/2] RISC-V: A proposal to add vendor-specific code
In-Reply-To: <mhng-611cf294-d378-466f-83eb-6c114c70c585@palmer-si-x1c4>
References: <20181105065807.GA1286@andestech.com>
 <mhng-611cf294-d378-466f-83eb-6c114c70c585@palmer-si-x1c4>
Message-ID: <20181108024313.GA926@andestech.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Wed, Nov 07, 2018 at 07:45:52AM +0800, Palmer Dabbelt wrote:
> On Sun, 04 Nov 2018 22:58:07 PST (-0800), vincentc at andestech.com wrote:
> > On Fri, Nov 02, 2018 at 01:48:57AM +0800, Karsten Merker wrote:
> >> On Wed, Oct 31, 2018 at 10:27:05AM -0700, Palmer Dabbelt wrote:
> >> > On Wed, 31 Oct 2018 04:16:10 PDT (-0700), anup at brainfault.org wrote:
> >> > > On Wed, Oct 31, 2018 at 4:06 PM Vincent Chen <vincentc@andestech.com> wrote:
> >> > > >
> >> > > >   RISC-V permits each vendor to develop respective extension ISA based
> >> > > > on RISC-V standard ISA. This means that these vendor-specific features
> >> > > > may be compatible to their compiler and CPU. Therefore, each vendor may
> >> > > > be considered a sub-architecture of RISC-V. Currently, vendors do not
> >> > > > have the appropriate examples to add these specific features to the
> >> > > > kernel. In this RFC set, we propose an infrastructure that vendor can
> >> > > > easily hook their specific features into kernel. The first commit is
> >> > > > the main body of this infrastructure. In the second commit, we provide
> >> > > > a solution that allows dma_map_ops() to work without cache coherent
> >> > > > agent support. Cache coherent agent is unsupported for low-end CPUs in
> >> > > > the AndeStar RISC-V series. In order for Linux to run on these CPUs, we
> >> > > > need this solution to overcome the limitation of cache coherent agent
> >> > > > support. Hence, it also can be used as an example for the first commit.
> >> > > >
> >> > > >   I am glad to discuss any ideas, so if you have any idea, please give
> >> > > > me some feedback.
> >> > > >
> >> > > I agree that we need a place for vendor-specific ISA extensions and
> >> > > having vendor-specific directories is also good.
> >> > >
> >> > > What I don't support is the approach of having compile time selection
> >> > > of vendor-specific ISA extension.
> >> > >
> >> > > We should have runtime probing for compatible vendor-specific ISA
> >> > > extension. Also, it should be possible to link multiple vendor-specific
> >> > > SA extensions to same kernel image. This way we can have a single
> >> > > kernel image (along with various vendor-specific ISA extensions) which
> >> > > works on variety of targets/hosts.
> >> > >
> >> > > As an example or runtime probing you can look at how IRQCHIP or
> >> > > CLOCKSOURCE drivers are probed. The vendor-specific ISA extension
> >> > > hooks should called in similar fashion.
> >> >
> >> > Yes, I agree.  My biggest concern here is that we ensure that
> >> > one kernel can boot on implementations from all vendors.  I
> >> > haven't had a chance to look at the patches yet, but it should
> >> > be possible to:
> >> >
> >> > * Build a kernel that has vendor-specific code from multiple vendors.
> >> > * Detect the implementation an run time and select the correct extra
> >> >   code.
> >>
> >> From a distro point of view we definitely want to have one kernel
> >> image that is bootable everywhere.  Debian won't support any
> >> platform that requires a per-platform or per-vendor kernel, and I
> >> assume that the same will be true for Fedora and Suse.
> >>
> >> One thing that I have stumbled upon while looking at the patches
> >> is that they seem to assume that X-type ISA extensions are
> >> strictly per vendor.  Although that is probably true in the
> >> majority of cases, it doesn't necessarily have to be - I could
> >> e.g. imagine that the DSP extensions from the PULP cores might
> >> be used by multiple vendors.  If such an extension would have
> >> state that needs to be saved on context switch, it would need
> >> corresponding kernel support.  Using "PULP" (or any other
> >> open-source project) as the vendor in such a case leads to
> >> another potential issue: the patches base everything on a JEDEC
> >> vendor ID that is compared to the contents of the mvendorid CSR,
> >> but such a JEDEC vendor ID usually doesn't exist for open-source
> >> implementations; the majority of those have mvendorid set to
> >> zero.
> >>
> > Many thanks for kinds of comments. I quickly synthesize the comments and
> > list them as below.
> > 1. The kernel image shall include all vendor-specific code.
> > 2. This kernel image can only enable particular vendor-specific features
> >    based on the CPU vendor in the running platform.
> >    - The runtime probing mechanism can refer to arm32/arm64, powerpc,
> >      IRQCHIP driver or CLOCKSOURCE driver
> >    - For some cases, such as open-source projects, using CSR $mvendorid
> >      to identify the compatibility is not appropriate.
> > I think the above requirements are reasonable, but I have questions about
> > the first requirement in practice. As far as I know, vendors are allowed
> > to add specific instructions and CSRs which are incompatible with other
> > vendors to their own ISA extensions. If I understand the first requirement
> > correctly, it implies that we need a "super" RISC-V toolchain. This "super"
> > RISC-V toolchain should recognize all kinds of vendor-specific instructions
> > and CSRs, so that it can compile vendor sources into objects successfully;
> > then it should recognize all kinds of vendor-specific relocations, so that
> > it can link the objects successfully. Each of them is not trivial at the
> > time of this proposal and in foreseeable future.
> >
> > If it will take a long time to complete this "super" toolchain, I suppose
> > the infrastructure in this RFC might be a temporary solution before it is
> > ready. This scheme does not suffer the compilation problems caused by the
> > lack of the super toolchain because the selection of vendor-specific ISA
> > extension is determined at compile time. In addition, the mechanism for
> > checking compatibility at runtime ensures that the kernel with
> > vendor-specific feature runs on CPUs of other vendors just like pure
> > RISC-V kernel. In other words, this scheme, to some extent, satisfies the
> > requirements that one kernel image is bootable everywhere.
> 
> I don't want anything in the kernel that can't be compiled by upstream GCC, as 
> that will be a huge mess.  As far as I'm concerned, the best way to move 
> forward is to figure out how each style of extension can be integrated.  Right 
> now, what I see is:
> 
> * Performance counters.  Here we should be safe, as there's an ISA-mandated 
>   space in which to put non-standard performance counters.  The support here is 
>   just figuring out how to interpret the bits.  This naturally fits into our 
>   current device-tree based mechanisms for probing hardware, and will be easy 
>   to maintain in the kernel.

Sure it is the case for the baseline PMU.  But the full function set of
perf is somehow limited in RISC-V as Alan mentioned in
Documentations/riscv/pmu.txt in his preliminary port.  He is planning to
share this topic and will provide some suggestions to enhance the
privileged spec at LPC next week.  I won't go into details to not go out
of focus, but I believe the vendor-specifics-go-SBI principle applies here.


> * Cache management.  It appears these are currently being described as 
>   instructions, which means they won't compile by default.  Here I think the 
>   best bet is to rely on the SBI, and if that's too slow to build a "SBI VDSO" 
>   mechanism to accelerate the relevant bits.  It is a bit of a headache, but 
>   we're not going to have anything standardized here quickly.
> 
> If those are the only two concerns then I think we're OK.  Are there any other 
> extension you're worried about?
No, currently only these two extensions.



Thanks everyone for all the comments. I quickly summarize these comments in
this round.
1. Kernel can support vendor specific features if the sources of these
   specific features can be compiled using upstream GCC.
   - The specific instructions and CSRs which cannot be compiled by
     upstream GCC shall rely on the SBI.
   - Using "SBI VDSO" mechanism to accelerate the SBI procedure 

2. arch/riscv/<extension> is more appropriate than arch/riscv/<vendor>
   - Some extensions might be available as IP to vendors, so multiple
     vendors might use the same extension made/licensed from another vendor

Basically, we glad to accept the above resolutions or comments except for
a tiny misunderstanding. The cache management in our extension is achieved
actually by CSR operation. Hence, we still hope the specific CSRs can be
supported from kernel now because the standard "SBI VDSO" scheme takes time
to develop. we propose a scheme that kernel can support the specific CSRs
and meet the criterion of compilation simultaneously. The upstream GCC
cannot recognize the specific CSRs because the CSRs access is made by the
CSRs name. If we change the access method from the CSR name to the CSR
number, the compilation problem of upstream GCC will not exist. This
scheme may suffer another problem, CSR number conflict. We think this
problem may be solved by runtime probing mechanism and vendor-defined
callbacks. The CSR number conflicts may occur in the following two
conditions. 
1. the specific CSR number conflicts with the vendors which do not support
   this extension. The runtime probing mechanism can avoid this case.
2. the specific CSR number conflicts with the vendors which support this
   extension. In this case, each vendor which supports this extension needs
   to define self-callbacks to access these specific CSRs through the
   vendor-defined CSR number.

If most people can accept the this scheme, we will include it in our next
version patch.


Regards
Vincent
