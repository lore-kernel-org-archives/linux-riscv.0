Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9059C54798
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Mar 2024 17:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Cc:Date:In-Reply-To:From:
	Subject:Mime-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4ko7Ca3xTFtTzVcWmS5XkuampslBMRbt/87eP/cG1ro=; b=o2rJaB7WnXotlR
	7t1BbEOy6OfoBA6vSsf3WKiwz9NXHKF14a1ddzWeUnWvES983cgNC0woD4MygvP4NxO6/JAXwG5h2
	S/Ah28a3qmJ4BZJXUy0fmk9/hSMcP47F24Nw4VueMoiOtOPXnML+GmiTZLp9VXAdlMRyn1BFasEgy
	M0sokg5tXBVy+Hb4kgqt2S+pSImmWnyJp4fHXzVT5FsGQAsssHokud1usHFpameG1budxNYEf0N/W
	AjXkXo63R0SU9zdP8Fcm5NHss9F/rXrnrMlRpW28iIE8E0TwHWSXEgcdXQ/v1H96MMo7P9ChVUg4J
	C+fESgPkgiFRTVjUCN3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhYQX-0000000Eewm-1LDA;
	Tue, 05 Mar 2024 17:18:05 +0000
Received: from out203-205-221-173.mail.qq.com ([203.205.221.173])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhYQT-0000000Eew4-1jFh
	for linux-riscv@lists.infradead.org;
	Tue, 05 Mar 2024 17:18:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1709659063; bh=h1LTH6JlAYoOApJUnNVPyf95mfcxBxOkhaNODYU3s9k=;
	h=Subject:From:In-Reply-To:Date:Cc:References:To;
	b=SPiDK/bA+pfghTDSPzaXNRELUSE0VpJ1C9l8p79dG//xvTRlJ1tbXwEr2wYraVsUY
	 UyYPR0M436xRq0K9P6At8kLAV3QRvxIWBZGLCBboEc58pQTmwpxNloz3Sphvqd4CWL
	 jO4LM1kDZef4Mnmqi6UcpRN7jCmzt8rjjamJds3Q=
Received: from smtpclient.apple ([2001:da8:c800:d084:84f7:c158:bab8:8899])
	by newxmesmtplogicsvrszb9-1.qq.com (NewEsmtp) with SMTP
	id 467314A0; Wed, 06 Mar 2024 01:17:39 +0800
X-QQ-mid: xmsmtpt1709659059trsahnpa9
Message-ID: <tencent_3638D6E106C784859837E6F3C10BDA688F0A@qq.com>
X-QQ-XMAILINFO: NJZTpFGUMYNFt/STRSnmNanLRlv+mPJcdXyrQHRC4MjkD977hfF0dHwRU2EIfN
	 XYxgfzvRrE1brWIIjF9OhanlPDr/oV/0DRHZbKq0zvC5CElI6a/9pcvvC7DHhU5hCOxNzIX+/53r
	 ZC7wqApkEdQFmPMO6NVOdxLzHr8fSuZJZwBIWn09pu7QF0Wn9gMD1VZHp7z3aejWh+5b1Yc1Qrur
	 zph6NdrWlPwC/CfyjHzPCF/74IxvIBYIaQcBNGtqT7LV+tg6smhRg/zHfzJKzx8ANPo5XwR/x1+Q
	 /j67DOdbeDSKFQQxVsBIeUWK6XhgHdqi6TiUVf5FbEX2jrXRa5UdcvIgUb7yYwtv8YsUgMxJBSx3
	 ESAhAQ1L2qpHT9tangOTIRFCxkwfVIuVxtFnWNqD6xmdtlU5f5F4bW/6cOoBrGWhtsdwr3SjvdcC
	 +rcBicfEKa7ikuzs5fY/zcP7uDtbkCR1CjSyQUaOCqNXvHM+hsFHAFfRWc5AUmEmDv2vkYxAHo1R
	 SYnNQjVo5/6CafYVSsJ6XHquDhCia4psSafXx/2BWIAWx6E2Aio9laQviGiAu3LK17iSmxs/9fSA
	 3EOf16UtX6eewIUvAVi2cwVMnZnz8A9m1PpBtfBaMVMDCnvNHhRlF2e72AQfH2fizfvNZ1yvtnhB
	 vBdBiwwHBPSr2yC5YHD7hBwOZWpiBCP3ZcmxUx8TAcdFBUebftxRc35BxBPZW6pjfEhH8gRk4tuA
	 lrIRHSQOLNFJRZQm44/DqAFgxty2jWM3No1kbCnZ2WLIkfkaxdnaYh8mCE+ObvKd8LVgbXAyznrb
	 KJuyr/UZ0T5BHVP+gOKS2IdTXam4tMQtRAfQ/MqRFW+rr/kKdM5L0ZMsV4hY1dXBE3Qxco+GruWs
	 ACUqKmA00dv8/UAuyFb4sVAjqFHV+EIZnEP36LZboNpHbAAcO4zrPGexYIiHTCRhiUui7xlGmA6j
	 I+JE8+cN52VXFCb4EbN/qLTcBeRU88cKXK5SbzohC6ntp5x3VjM2OvasBe5lq/yLV1lQ2nSkLIPc
	 S8r8djg6HeLjADlWd6
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.400.31\))
Subject: Re: [PATCH v3 6/7] riscv: dts: add initial canmv-k230 and k230-evb
 dts
From: Yangyu Chen <cyy@cyyself.name>
In-Reply-To: <20240305-shorten-disallow-eae65fdc8fdb@spud>
Date: Wed, 6 Mar 2024 01:17:29 +0800
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org,
 Damien Le Moal <dlemoal@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 krzysztof.kozlowski+dt@linaro.org,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 guoren@kernel.org,
 devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-OQ-MSGID: <C39896C7-3E16-48AF-8368-84BB10671CD4@cyyself.name>
References: <mhng-f1aa91d4-211f-4eb4-a94d-a9d88b0d3f6a@palmer-ri-x1c9>
 <7A86D933-B85F-4B29-8D6D-AB414A42AC06@cyyself.name>
 <tencent_B2C1146D4947315C8018AE90EDC64F3E6207@qq.com>
 <20240305-shorten-disallow-eae65fdc8fdb@spud>
To: Conor Dooley <conor@kernel.org>
X-Mailer: Apple Mail (2.3774.400.31)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240305_091802_389888_A3F8598E 
X-CRM114-Status: GOOD (  25.36  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org



> On Mar 6, 2024, at 01:01, Conor Dooley <conor@kernel.org> wrote:
> 
> Hey,
> 
> Just chiming so that things don't get misinterpreted.
> 
> On Wed, Mar 06, 2024 at 12:37:16AM +0800, Yangyu Chen wrote:
>>> On Mar 6, 2024, at 00:22, Yangyu Chen <cyy@cyyself.name> wrote:
>>>> On Mar 5, 2024, at 23:54, Palmer Dabbelt <palmer@dabbelt.com> wrote:
>>>> On Mon, 04 Mar 2024 13:06:00 PST (-0800), cyy@cyyself.name wrote:
>>>>> - Svpbmt and T-Head MAEE both supported
>>>>> 
>>>>> T-Head C908 does support both Svpbmt and T-Head MAEE for page-based memory
>>>>> attributes and is controlled by csr.mxstatus. If the kernel wants to use
>>>>> svpbmt, the m-mode software should set BIT(21) of csr.mxstatus to zero
>>>>> before entering the s-mode kernel. Otherwise, the kernel will not boot as 0
>>>>> on T-Head MAEE represent to NonCachable Memory and it will lose dirty cache
>>>>> lines modification that haven't been written back to the memory.
>>>> 
>>>> So I guess we need the bootloader to just be accurate here?  ie: whatever
>>>> extension it tells S-mode kernels is enabled is how S-mode behaves, and
>>>> then this should just work itself out.
> 
> Correct, the bootloader/firmware "just" needs to write this bit to match
> what it passes to onwards in the devicetree.
> 
>>> Yes. Currently, I have patched OpenSBI to disable MAEE. Conor Dooley said
>>> from a public irc group that he wants to control the enable of T-Head
> 
> (#riscv on libera, the usual location)
> 
> I also suggested that that, given we can use the standard extensions,
> we should use them instead of the custom extensions/errata.
> 
>>> variation of zicbom and svpbmt from dts, in addition to mimplid or
>>> something now.
> 
> Correct. I'm find with the impid == archid == 0 condition, given that's
> what we need to keep to avoid regressions, but if any future T-Head CPUs
> want to enable MAEE (ERRATA_THEAD_PBMT) or the custom CMOs
> (ERRATA_THEAD_CMO) these should be enabled from DT. Particularly when
> these CPUs can be configured to either use the T-Head versions or the
> standard extensions.
> 
>>> I think that will be a better way for the bootloader to tell
>>> the kernel whether the T-Head MAEE should be enabled.
> 
> You've got three options I guess. You could patch the DT in the bootloader,
> or use a fixed DT that matches the bootloader, or you could use the DT
> passed to the bootloader and parse the extensions to decide whether or not
> to enable MAEE or Svpbmt. Seems you're going for option 2.
> 

The patched opensbi is only for work around now as the factory-provided
M-Mode uboot will enable MAEE. I would like option 1 to let the bootloader
choose what to use and patch the DT to tell the linux whether should use
T-Head MAEE as T-Head is likely to use this feature on TEE
(Trusted Execution Environment), so it might never be removed.

>>> Link: https://github.com/cyyself/opensbi/commit/b113c1c01d700314a4a696297ec09031a9399354
>>> 
>>> Furthermore, I wonder whether a CPU node like this would be acceptable.
>>> I don't have any other details of how another CPU from K230 SoC works on
>>> Linux.
> 
> A CPU node like what? It is not clear to me.

It in the k230.dtsi file. Only has big core there.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
