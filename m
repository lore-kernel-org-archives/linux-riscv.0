From: olof@lixom.net (Olof Johansson)
Date: Wed, 31 Oct 2018 12:17:32 -0700
Subject: [RFC 0/2] RISC-V: A proposal to add vendor-specific code
In-Reply-To: <mhng-01f0ac6a-c2fd-41be-9d53-44d1c139d453@palmer-si-x1c4>
References: <CAAhSdy0Y_jdc=2Lf8epof_+7HigCfhDxMNe8EF0fHfncqhs-zA@mail.gmail.com>
 <mhng-01f0ac6a-c2fd-41be-9d53-44d1c139d453@palmer-si-x1c4>
Message-ID: <CAOesGMjHTRqqUWB9=XQADPxA+EWwcOSBrFsJB7c4m2b9kBAOmQ@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Wed, Oct 31, 2018 at 10:27 AM Palmer Dabbelt <palmer@sifive.com> wrote:
>
> On Wed, 31 Oct 2018 04:16:10 PDT (-0700), anup at brainfault.org wrote:
> > On Wed, Oct 31, 2018 at 4:06 PM Vincent Chen <vincentc@andestech.com> wrote:
> >>
> >>   RISC-V permits each vendor to develop respective extension ISA based
> >> on RISC-V standard ISA. This means that these vendor-specific features
> >> may be compatible to their compiler and CPU. Therefore, each vendor may
> >> be considered a sub-architecture of RISC-V. Currently, vendors do not
> >> have the appropriate examples to add these specific features to the
> >> kernel. In this RFC set, we propose an infrastructure that vendor can
> >> easily hook their specific features into kernel. The first commit is
> >> the main body of this infrastructure. In the second commit, we provide
> >> a solution that allows dma_map_ops() to work without cache coherent
> >> agent support. Cache coherent agent is unsupported for low-end CPUs in
> >> the AndeStar RISC-V series. In order for Linux to run on these CPUs, we
> >> need this solution to overcome the limitation of cache coherent agent
> >> support. Hence, it also can be used as an example for the first commit.
> >>
> >>   I am glad to discuss any ideas, so if you have any idea, please give
> >> me some feedback.
> >>
> >
> > I agree that we need a place for vendor-specific ISA extensions and
> > having vendor-specific directories is also good.
> >
> > What I don't support is the approach of having compile time selection
> > of vendor-specific ISA extension.
> >
> > We should have runtime probing for compatible vendor-specific ISA
> > extension. Also, it should be possible to link multiple vendor-specific
> > SA extensions to same kernel image. This way we can have a single
> > kernel image (along with various vendor-specific ISA extensions) which
> > works on variety of targets/hosts.
> >
> > As an example or runtime probing you can look at how IRQCHIP or
> > CLOCKSOURCE drivers are probed. The vendor-specific ISA extension
> > hooks should called in similar fashion.
>
> Yes, I agree.  My biggest concern here is that we ensure that one kernel can
> boot on implementations from all vendors.  I haven't had a chance to look at
> the patches yet, but it should be possible to:
>
> * Build a kernel that has vendor-specific code from multiple vendors.
> * Detect the implementation an run time and select the correct extra code.
>
> This is essentially the same as my feedback for the performance counter stuff,
> which IIRC is what prompted adding a vendor-specific extensions.
>
> If I was going to do this, I'd split it up such that the vendor-specific
> additions are per-subsystem.  That way we can focus on building a decent
> interface for each subsystem that needs vendor-specific support rather than
> just bundling everything together where the vendor-specific stuff will get all
> tangled together.

For short-term, powerpc's model of a machine descriptor with function
pointers that's either filled in at runtime, or set to the right
pre-defined structure per platform, should cover most of this I think?

Even if you have cases where an indirect branch isn't feasible,
performance-wise, _getting_ the function address from the table and
doing runtime alternatives-style patching still gives one place to
keep it.

I'm not sure if we need a table/struct per subsystem, or if one larger
shared one is sufficient to start. Since this is all in-kernel code
without external interface, I'd suggest starting simple and refactor
later if needed.


-Olof
