Return-Path: <SRS0=/DNs=NT=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD52EC0044C
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  8 Nov 2018 02:46:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6449020857
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  8 Nov 2018 02:46:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Psh7j80I";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="DyuE0ean"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6449020857
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=andestech.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NB+3jASKCS8qiessNa5vEXdot4tWQwaFlkPvQwzYuec=; b=Psh7j80IBiusWU
	i/DMKn3N1WcgCVMuS1QnFA7nqwd0+3s0T5bhJYnDshMnFGcPmnLlcvlK0hQs6/oJ1V9dq3U6Y66D8
	JOSKqP6Gp1Yrk0Yzd9StxJ4dr3pAUHpj38yw44ukRDtkmsKX5NIi7zibmLS6yMddkxGBHp6siLaHw
	h8rWluhVEHi2lSKSjfA1mSO9saVGpc6HIoimK1qc9gnF4ziyMbwk0rprw3Yelb0mGK5lDKUzSsKjp
	LUvRDH/qxhXOnEA6mzLJUqC9Ei0XKSfFPE84EDW71KY7U3JuOw5EKUbIMFQd3b+ywAASAZbQloDwo
	rDxt5XGkg4UalEkBoz6Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gKaLI-0002Ri-5R; Thu, 08 Nov 2018 02:46:48 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gKaLG-0002RF-Ha
 for linux-riscv@bombadil.infradead.org; Thu, 08 Nov 2018 02:46:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:CC:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jDXRDGGSM2oBe6JzlP8ytKMOkNm1vdk+E/2o/Xzh/Rs=; b=DyuE0ean6XRmXJZQCSMtEQnve
 w8FDBs2aQDSSN+XAgpZa6mfNgFVcuP02H2iMko8pfgnqbItB3zq9q69rgRz4Sw4wGwIrLVJlgRtfS
 nopY80oyxYOt5XV/HfKHj4n/GqM1RFUK2pxi0gCUDLrKH1H76HKfqHhOFcR//RJKpkHhTpbdvlbh/
 TZa82lum6+M/OA7gjFQSXiJ4glAvdBi0BVtDbQuKbO3orc4dVT3wZ+lA7cajZQEf22IOY6Ohvf+MV
 BLvPPbx1LJuFN2wEnFAMFujo7o0+gn7UIKfeRCfp5ArXsIb2p+nP7NT+YNNFN/4Y5ZFACXZhNy2fQ
 A0rdla+rQ==;
Received: from 59-120-53-16.hinet-ip.hinet.net ([59.120.53.16]
 helo=ATCSQR.andestech.com)
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gKaLA-0004c4-K0
 for linux-riscv@lists.infradead.org; Thu, 08 Nov 2018 02:46:44 +0000
Received: from mail.andestech.com (atcpcs16.andestech.com [10.0.1.222])
 by ATCSQR.andestech.com with ESMTP id wA82hYYo004421;
 Thu, 8 Nov 2018 10:43:34 +0800 (GMT-8)
 (envelope-from vincentc@andestech.com)
Received: from andestech.com (10.0.15.65) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.123.3; Thu, 8 Nov 2018
 10:43:16 +0800
Date: Thu, 8 Nov 2018 10:43:13 +0800
From: Vincent Chen <vincentc@andestech.com>
To: Palmer Dabbelt <palmer@sifive.com>
Subject: Re: [RFC 0/2] RISC-V: A proposal to add vendor-specific code
Message-ID: <20181108024313.GA926@andestech.com>
References: <20181105065807.GA1286@andestech.com>
 <mhng-611cf294-d378-466f-83eb-6c114c70c585@palmer-si-x1c4>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-611cf294-d378-466f-83eb-6c114c70c585@palmer-si-x1c4>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.0.15.65]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com wA82hYYo004421
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181108_024641_524793_CF8175BA 
X-CRM114-Status: GOOD (  73.38  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
 Arnd Bergmann <arnd@arndb.de>,
 "Alan Quey-Liang Kao\(?????????\)" <alankao@andestech.com>,
 "Greentime Ying-Han Hu\(?????????\)" <greentime@andestech.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "Zong Zong-Xian Li\(?????????\)" <zong@andestech.com>, "Kito Huang-Jia
 Cheng\(?????????\)" <kito@andestech.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "deanbo422@gmail.com" <deanbo422@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181108024313.3Pn-cBQFUzKF9QrwJ8h33A88l-37PvoHas9u8QXaXBY@z>

On Wed, Nov 07, 2018 at 07:45:52AM +0800, Palmer Dabbelt wrote:
> On Sun, 04 Nov 2018 22:58:07 PST (-0800), vincentc@andestech.com wrote:
> > On Fri, Nov 02, 2018 at 01:48:57AM +0800, Karsten Merker wrote:
> >> On Wed, Oct 31, 2018 at 10:27:05AM -0700, Palmer Dabbelt wrote:
> >> > On Wed, 31 Oct 2018 04:16:10 PDT (-0700), anup@brainfault.org wrote:
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

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
