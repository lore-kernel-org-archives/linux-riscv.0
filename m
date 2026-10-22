Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BCE3606A321
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Oct 2026 09:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zebAh9uu;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BtbhcMcf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=3g91gJzqgLB4FUPchXyBLEw5/0cCl/MCBry+W1u7G+g=; b=zebAh9uu8iKB1DQ4LjZt75ZPLb
	CL2FgwAYb4LJM7SvXodQ+8Rfdckzae9/Tt1gLEz+kWOPYcbbcr38FW/Zf8Wc6EMi4DKc3alO+JOWn
	mxFQe0U3bXDMSUDphXQ6Ie249FhYQEHpj2KlueZr9zdCtRY/L7fkiELI3IhNjlL456rHE+SSbPJ6d
	85CY+q8ErDstacO8OrJlNDIkpWBt5bpBHZfSHktvm7u9YnRbDYb5j7iBHZl+zkjvDkVrHQlTgaNUS
	vWn7iUTg6HQYsv80IsFCQrqLf1jQ7F7W/vBbD5I+hExH9QKrpGcycrBndwtkaDVRx1RtoyVJJXL/u
	V/mtrnHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJpaG-0000000DtVY-3MGq;
	Thu, 22 Oct 2026 09:59:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJpaF-0000000DtV1-1bHN
	for linux-riscv@lists.infradead.org;
	Thu, 22 Oct 2026 09:59:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F316E42DD6;
	Thu, 22 Oct 2026 09:59:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C69681F000C8;
	Thu, 22 Oct 2026 09:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792663178;
	bh=IoH7ekxN//XilbjyHr/WJ7HKfImuR7n5++a/wt+yFvc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BtbhcMcf1IpwvLJwfCFCO2HbnnTWGh+2wjxLooRbBwVXv6jZq1Dq9RrWOXuZlIcIM
	 0LjgiRYGO6PyvlsRCAtx6KbdXCx3zJHLHbZWsna5F5Qlu7BHz5EYT/HnkoiHwhXckG
	 ppXGvymm1kR7ds29QEyI4saH1fOOf8oGEYY44SEqiyH7iTJtVtouLT0dHKI3WPG4//
	 eT1jDI3z9J77BNGfxUMRnm2t9IaEu7yvoaWoauZ24H1JbhgfTLTPq989SFFb0ZIxjZ
	 k1dbIsP0spq+nfDB1TNkmEUIFTbwJk1PKPjfX62FlFRVAQagxtSglL6ZuNVbMcA4qg
	 ltQ+F82tjDzBw==
Date: Thu, 22 Oct 2026 11:59:35 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jonathan McDowell <noodles@earth.li>
Cc: Roberto Sassu <roberto.sassu@huaweicloud.com>, catalin.marinas@arm.com, 
	will@kernel.org, mark.rutland@arm.com, chenhuacai@kernel.org, kernel@xen0n.name, 
	maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, chleroy@kernel.org, 
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	tglx@kernel.org, mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, 
	hpa@zytor.com, robh@kernel.org, saravanak@kernel.org, x86@kernel.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, zohar@linux.ibm.com, noodles@fb.com, 
	linux-integrity@vger.kernel.org, linux-security-module@vger.kernel.org, 
	Roberto Sassu <roberto.sassu@huawei.com>
Subject: Re: [PATCH v2] kexec: Select ima_get/free_kexec_buffer() with
 CONFIG_HAVE_IMA_KEXEC(_OF)
Message-ID: <20261022-whispering-cerise-malamute-94d7db@quoll>
References: <20261020083727.1906495-1-roberto.sassu@huaweicloud.com>
 <ath534EEbFntir8j@earth.li>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ath534EEbFntir8j@earth.li>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Oct 21, 2026 at 09:37:51AM +0100, Jonathan McDowell wrote:
> On Tue, Oct 20, 2026 at 10:37:27AM +0200, Roberto Sassu wrote:
> > From: Roberto Sassu <roberto.sassu@huawei.com>
> > 
> > On x86, if CONFIG_OF_FLATTREE is enabled, the kernel uses the device tree
> > implementation of ima_get/free_kexec_buffer(). However, x86 passes the IMA
> > buffer location through setup_data, not through the device tree, so the
> > buffer is never found and the IMA measurement list is not carried over
> > across kexec.
> > 
> > Introduce CONFIG_HAVE_IMA_KEXEC_OF (which selects CONFIG_HAVE_IMA_KEXEC)
> > and select it for the architectures that pass the IMA buffer location
> > through the device tree, via of_kexec_alloc_and_setup_fdt() (arm64,
> > powerpc and riscv). Build the device tree implementation of
> > ima_get/free_kexec_buffer() only if the new option is enabled.
> > 
> > Select the new option also on LoongArch, to preserve the current behavior
> > and avoid a link failure. LoongArch does not pass the buffer location to
> > the next kernel yet; this will be addressed separately.
> > 
> > Finally, don't select it for x86, and use x86's own setup_data-based
> > implementation regardless of CONFIG_OF_FLATTREE.
> > 
> > Fixes: b69a2afd5afc ("x86/kexec: Carry forward IMA measurement log on kexec")
> > Signed-off-by: Roberto Sassu <roberto.sassu@huawei.com>
> 
> Reviewed-By: Jonathan McDowell <noodles@meta.com>

Please use kernel style tags, so Reviewed-by.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
