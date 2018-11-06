Return-Path: <SRS0=W42x=NR=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDFF2C32789
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  6 Nov 2018 23:46:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE8C92086A
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  6 Nov 2018 23:46:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="V69hdRiJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="ZVsYIaBT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE8C92086A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=8Rbixk00aCci6uN9gO9yD+rA1BQxhPgZul/uPW6A21s=; b=V69hdRiJv9SvOtPefrGH7A6zt
	wd45IazyouLhaU4IQbsthKsk0GepJJIYb+bUxWusYfL9YvJbqKqhmmumGapedswNZtH4MvudNJQlA
	Wdol8bIsRod6plLCc13AAs2bMlNrLvTHY+2hLJ1NAAIeECI+PnNc6WhPD1NXSDahc8TS0Yto4wQ+j
	w3Yt5PZbe1uQCgglkEKFGcQXjuKMAkIfwEDcP8psWjHLoI5Aodtnzm0eohYLp8l/6Fh1yed8AiTG4
	0vdt9WE6cVuaD1ic1snog4khaeXkt2wi481kl522AVmg/fKoFk1cG0pCQqhZtkeISIExswyjatDv4
	VBEDgqlIg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gKB2u-0002Ds-Oc; Tue, 06 Nov 2018 23:46:08 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gKB2r-0002C7-Ed
 for linux-riscv@lists.infradead.org; Tue, 06 Nov 2018 23:46:07 +0000
Received: by mail-pf1-x442.google.com with SMTP id g7-v6so4585853pfo.10
 for <linux-riscv@lists.infradead.org>; Tue, 06 Nov 2018 15:45:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=3mZx8qDroV6FAU5EZ6pqnwSrOu6KAm56fCYs5Ed1eNo=;
 b=ZVsYIaBTty5C4Sa9GGFzh1uVTd+nkurOgr8rifxK5Oin+N0y2s4MUGZTORikfExSMf
 /zPh0ODraQS0ksvXesdg+Fru56wUZ6hLVMt4/ZH16z8YseNx/CJ0atKYKUqCbBZWfdOf
 E9jHO0SX4PK9H7SZG31PO5VJj9IdrXgDT0Fnv4L2u4zhXjOpKK/bUW2jbT5tpRvfAJ5d
 eOE2uOrrcpYsAzl04Fuo3Oh0qOA8blnANQRZVGX8Rtu4/ugMlSem+oFMkEUi3kSgYWjj
 uBW3Z7vq4OvRDR3b9qTB1jqYR2yAjxx7/ztNJik1gC5F1QoHiaIJFzvDs5wT+6hdqldj
 5nVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=3mZx8qDroV6FAU5EZ6pqnwSrOu6KAm56fCYs5Ed1eNo=;
 b=qEBZe24qAhLNfTJ5OPCq0OZCo9CNGkH0uyv95ld6bW06ucUK2/GOVjvz0crfntrG+y
 mMUUaMb0Mj3+ot9fn/eG3zecbPfRhdo606Tcx9mSbhzRGN+Og2dobs8w+Bh1mM9pWWPF
 jj4WT5tH7vYWK71KSCmCr2PgwxE3PvQbFUv25CTpxQ3vrPloWIoWHxR+E8fklsOsaf6C
 Mb3zc/9cx2u3uROy1ZsfPMglG/FLJQLjXW1Ra0BVtNtvwoKkJ+NPjtGi9aR4ocdoARAV
 4ldAJTNiSqygKj8/o93JSbSSEgaz8mPXYdWT6F7izjr44spxU+rvQFEbR4FyeOEg60Tp
 6Ghg==
X-Gm-Message-State: AGRZ1gLQzY8/t7p5eaUHbREmN2pK8/2i7cnLyxGujluGCAR+EJbXIRz3
 wGfC3zaPxLdcW1WUll6z2+dR+A==
X-Google-Smtp-Source: AJdET5dQHmidbtAakfSLdXJQdD+u6AiivLS0XcExdf0bj9QD3WuNGSZZr4vdV5w7XMULevxHPtso3w==
X-Received: by 2002:a65:63d3:: with SMTP id n19mr3377444pgv.179.1541547952958; 
 Tue, 06 Nov 2018 15:45:52 -0800 (PST)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id z2sm15440462pgu.4.2018.11.06.15.45.51
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 06 Nov 2018 15:45:52 -0800 (PST)
Date: Tue, 06 Nov 2018 15:45:52 -0800 (PST)
X-Google-Original-Date: Tue, 06 Nov 2018 15:41:54 PST (-0800)
Subject: Re: [RFC 0/2] RISC-V: A proposal to add vendor-specific code
In-Reply-To: <20181105065807.GA1286@andestech.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: vincentc@andestech.com
Message-ID: <mhng-611cf294-d378-466f-83eb-6c114c70c585@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181106_154605_492192_E5D9FCAA 
X-CRM114-Status: GOOD (  40.35  )
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
Cc: zong@andestech.com, aou@eecs.berkeley.edu, Arnd Bergmann <arnd@arndb.de>,
 alankao@andestech.com, greentime@andestech.com, linux-kernel@vger.kernel.org,
 vincentc@andestech.com, kito@andestech.com, linux-riscv@lists.infradead.org,
 deanbo422@gmail.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181106234552.CpKcppI1_RlzTa3iOGLnnB7mftjoSBooinO3Rua73Ac@z>

On Sun, 04 Nov 2018 22:58:07 PST (-0800), vincentc@andestech.com wrote:
> On Fri, Nov 02, 2018 at 01:48:57AM +0800, Karsten Merker wrote:
>> On Wed, Oct 31, 2018 at 10:27:05AM -0700, Palmer Dabbelt wrote:
>> > On Wed, 31 Oct 2018 04:16:10 PDT (-0700), anup@brainfault.org wrote:
>> > > On Wed, Oct 31, 2018 at 4:06 PM Vincent Chen <vincentc@andestech.com> wrote:
>> > > >
>> > > >   RISC-V permits each vendor to develop respective extension ISA based
>> > > > on RISC-V standard ISA. This means that these vendor-specific features
>> > > > may be compatible to their compiler and CPU. Therefore, each vendor may
>> > > > be considered a sub-architecture of RISC-V. Currently, vendors do not
>> > > > have the appropriate examples to add these specific features to the
>> > > > kernel. In this RFC set, we propose an infrastructure that vendor can
>> > > > easily hook their specific features into kernel. The first commit is
>> > > > the main body of this infrastructure. In the second commit, we provide
>> > > > a solution that allows dma_map_ops() to work without cache coherent
>> > > > agent support. Cache coherent agent is unsupported for low-end CPUs in
>> > > > the AndeStar RISC-V series. In order for Linux to run on these CPUs, we
>> > > > need this solution to overcome the limitation of cache coherent agent
>> > > > support. Hence, it also can be used as an example for the first commit.
>> > > >
>> > > >   I am glad to discuss any ideas, so if you have any idea, please give
>> > > > me some feedback.
>> > > >
>> > > I agree that we need a place for vendor-specific ISA extensions and
>> > > having vendor-specific directories is also good.
>> > >
>> > > What I don't support is the approach of having compile time selection
>> > > of vendor-specific ISA extension.
>> > >
>> > > We should have runtime probing for compatible vendor-specific ISA
>> > > extension. Also, it should be possible to link multiple vendor-specific
>> > > SA extensions to same kernel image. This way we can have a single
>> > > kernel image (along with various vendor-specific ISA extensions) which
>> > > works on variety of targets/hosts.
>> > >
>> > > As an example or runtime probing you can look at how IRQCHIP or
>> > > CLOCKSOURCE drivers are probed. The vendor-specific ISA extension
>> > > hooks should called in similar fashion.
>> >
>> > Yes, I agree.  My biggest concern here is that we ensure that
>> > one kernel can boot on implementations from all vendors.  I
>> > haven't had a chance to look at the patches yet, but it should
>> > be possible to:
>> >
>> > * Build a kernel that has vendor-specific code from multiple vendors.
>> > * Detect the implementation an run time and select the correct extra
>> >   code.
>>
>> From a distro point of view we definitely want to have one kernel
>> image that is bootable everywhere.  Debian won't support any
>> platform that requires a per-platform or per-vendor kernel, and I
>> assume that the same will be true for Fedora and Suse.
>>
>> One thing that I have stumbled upon while looking at the patches
>> is that they seem to assume that X-type ISA extensions are
>> strictly per vendor.  Although that is probably true in the
>> majority of cases, it doesn't necessarily have to be - I could
>> e.g. imagine that the DSP extensions from the PULP cores might
>> be used by multiple vendors.  If such an extension would have
>> state that needs to be saved on context switch, it would need
>> corresponding kernel support.  Using "PULP" (or any other
>> open-source project) as the vendor in such a case leads to
>> another potential issue: the patches base everything on a JEDEC
>> vendor ID that is compared to the contents of the mvendorid CSR,
>> but such a JEDEC vendor ID usually doesn't exist for open-source
>> implementations; the majority of those have mvendorid set to
>> zero.
>>
> Many thanks for kinds of comments. I quickly synthesize the comments and
> list them as below.
> 1. The kernel image shall include all vendor-specific code.
> 2. This kernel image can only enable particular vendor-specific features
>    based on the CPU vendor in the running platform.
>    - The runtime probing mechanism can refer to arm32/arm64, powerpc,
>      IRQCHIP driver or CLOCKSOURCE driver
>    - For some cases, such as open-source projects, using CSR $mvendorid
>      to identify the compatibility is not appropriate.
> I think the above requirements are reasonable, but I have questions about
> the first requirement in practice. As far as I know, vendors are allowed
> to add specific instructions and CSRs which are incompatible with other
> vendors to their own ISA extensions. If I understand the first requirement
> correctly, it implies that we need a "super" RISC-V toolchain. This "super"
> RISC-V toolchain should recognize all kinds of vendor-specific instructions
> and CSRs, so that it can compile vendor sources into objects successfully;
> then it should recognize all kinds of vendor-specific relocations, so that
> it can link the objects successfully. Each of them is not trivial at the
> time of this proposal and in foreseeable future.
>
> If it will take a long time to complete this "super" toolchain, I suppose
> the infrastructure in this RFC might be a temporary solution before it is
> ready. This scheme does not suffer the compilation problems caused by the
> lack of the super toolchain because the selection of vendor-specific ISA
> extension is determined at compile time. In addition, the mechanism for
> checking compatibility at runtime ensures that the kernel with
> vendor-specific feature runs on CPUs of other vendors just like pure
> RISC-V kernel. In other words, this scheme, to some extent, satisfies the
> requirements that one kernel image is bootable everywhere.

I don't want anything in the kernel that can't be compiled by upstream GCC, as 
that will be a huge mess.  As far as I'm concerned, the best way to move 
forward is to figure out how each style of extension can be integrated.  Right 
now, what I see is:

* Performance counters.  Here we should be safe, as there's an ISA-mandated 
  space in which to put non-standard performance counters.  The support here is 
  just figuring out how to interpret the bits.  This naturally fits into our 
  current device-tree based mechanisms for probing hardware, and will be easy 
  to maintain in the kernel.
* Cache management.  It appears these are currently being described as 
  instructions, which means they won't compile by default.  Here I think the 
  best bet is to rely on the SBI, and if that's too slow to build a "SBI VDSO" 
  mechanism to accelerate the relevant bits.  It is a bit of a headache, but 
  we're not going to have anything standardized here quickly.

If those are the only two concerns then I think we're OK.  Are there any other 
extension you're worried about?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
