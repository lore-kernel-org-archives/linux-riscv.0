Return-Path: <SRS0=BHV5=OA=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60BF7C43441
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 21 Nov 2018 15:47:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3027821479
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 21 Nov 2018 15:47:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Xqw75a9Q";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="OwVpQ43C"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3027821479
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=OIeL1Plz3cbyUeSKEUtwSu5aohAkSVsk9va/txOvu+0=; b=Xqw75a9QLNmEskXwkkqhesj+x
	yoGyIZAHfFRxfTB849YpP2BHtb2crGlX0JLgkkKRK9qL4pCvt543mK4j15rPb9MxFNKDWXY2guYz+
	1p3aA083stN7mpdyo2fASbcZGp45+qO4V6nHhY5FCvs7ffMUWbzf/d5pcSUsvqql0PjSAH41rDAVv
	3CmVYusiKXN4fD03N2pSF4ZlujDjfudM4uwRwBPY/6sIrcdnbUSwq7B/75T63OD2Wbb/sznwL9g8p
	X1/lrkj1p9/wq4e9kK04DnK5F+Kd/N8s/hJ3Xwf22MPVDgBSXMWLhioGk39Xv1gjTD9HSzFZMlBbp
	yGT5X4PZQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gPUiv-0001xD-Jc; Wed, 21 Nov 2018 15:47:29 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gPUil-0001gZ-9U
 for linux-riscv@lists.infradead.org; Wed, 21 Nov 2018 15:47:22 +0000
Received: by mail-pl1-x641.google.com with SMTP id gn14so6072906plb.10
 for <linux-riscv@lists.infradead.org>; Wed, 21 Nov 2018 07:47:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=U/lY5CfdHLl3xwIXaQIRba/GPl3Jxhihr4NwbiVFjPo=;
 b=OwVpQ43CSWic4u6uy8EiX4jKWC+6GbIh1hQ2uLHBOxn55J2QmK/J9y7M7VBuV57UnY
 K/Y6wWyqTxEs/+0mJvSl8oBTR6DdKAncImadulVokxekAe/3eCZLhsPDMsVBkEGmRTim
 VhMmMIQ9LawdPvEMc+/jfP0vfTT5sGMvpwgW7YjNSR91NsdRxsY5l6VfXtoiH6n1bQhs
 4YWv+W4y84c8A81ySRAZ1JpUgGb+HJc+cxmhCe3H5swS7n4mRu0Do2Lv9ndTy+WsWV05
 aZWRazf5kGQCMZ2XjKUVV87al9jhGC6U6i14pP/eWICsOqELVHsriFVZmXp6TenE+Gp4
 c6Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=U/lY5CfdHLl3xwIXaQIRba/GPl3Jxhihr4NwbiVFjPo=;
 b=o0QR9Oe385jdE8nBXgp5RISyGZsEuA3rCd9tYI5sv2A51yltLdalZGhdQA+l860i0H
 +sqk7h0eRK15TUCuIe2ox0j09vbJ1GUWQApu03NIjxSxSeIoG/Uc0hAWQnTmdFTQ2nvr
 +RyLEixXFB7r77nX9CwkYtIzt4N2mr2w4QlKiRdN1+nm46O0XAnx7ghGTbkjUVSKDsBf
 shpUnb2gEGj27zutPTw2TiR+OU4q4qJKa3k6m+rSqIIIqlTOuIPUBAnetVbKFDGBVEek
 C97XfkH0wa/dpkeCbTxpiqoXQFxpQngN6kxP4CcKJpSD5AyNFwpQpjZbN0Eaj9q8ZrLJ
 htJA==
X-Gm-Message-State: AA+aEWb7Po9qUC612UHvxG70lXAiquKRXPNt3OL/MchVDtwZXpJvuPuY
 TPzuRVcMk6SwyDtBDKV1RwjbMg==
X-Google-Smtp-Source: AFSGD/UAi/NJ3PgiFeWjX4A041/WQ8nt8aNRCdGUah1xwxILNe5t4KPPa+Rg/oymu/oVkz81KUiVUQ==
X-Received: by 2002:a63:7f4f:: with SMTP id p15mr6498437pgn.296.1542815228599; 
 Wed, 21 Nov 2018 07:47:08 -0800 (PST)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id r6sm65610040pgk.91.2018.11.21.07.47.07
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 21 Nov 2018 07:47:07 -0800 (PST)
Date: Wed, 21 Nov 2018 07:47:07 -0800 (PST)
X-Google-Original-Date: Wed, 21 Nov 2018 07:44:37 PST (-0800)
Subject: Re: [PATCH v2 16/15] syscall_get_arch: add "struct task_struct *"
 argument
In-Reply-To: <20181121004422.GA29053@altlinux.org>
From: Palmer Dabbelt <palmer@sifive.com>
To: ldv@altlinux.org
Message-ID: <mhng-c75e14b8-b36c-46c2-8ffc-914312ed0cef@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181121_074719_352603_69114B11 
X-CRM114-Status: GOOD (  10.36  )
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
Cc: linux-mips@linux-mips.org, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, paul@paul-moore.com, linux-hexagon@vger.kernel.org,
 x86@kernel.org, esyr@redhat.com, lineprinter@altlinux.org,
 linux-snps-arc@lists.infradead.org, uclinux-h8-devel@lists.sourceforge.jp,
 linux-xtensa@linux-xtensa.org, linux-um@lists.infradead.org,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
 luto@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-c6x-dev@linux-c6x.org, linux-parisc@vger.kernel.org, oleg@redhat.com,
 eparis@redhat.com, linux-audit@redhat.com, linux-alpha@vger.kernel.org,
 nios2-dev@lists.rocketboards.org, linuxppc-dev@lists.ozlabs.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181121154707.jlDhfa78e-ybFSbW6cBw58S6FApcGiej3RdzDR4i-qk@z>

On Tue, 20 Nov 2018 16:44:22 PST (-0800), ldv@altlinux.org wrote:
> This argument is required to extend the generic ptrace API
> with PTRACE_GET_SYSCALL_INFO request: syscall_get_arch() is going to be
> called from ptrace_request() along with other syscall_get_* functions
> with a tracee as their argument.
>
> This change partially reverts commit 5e937a9ae913 ("syscall_get_arch:
> remove useless function arguments").
>
> Cc: linux-alpha@vger.kernel.org
> Cc: linux-arch@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-audit@redhat.com
> Cc: linux-c6x-dev@linux-c6x.org
> Cc: linux-hexagon@vger.kernel.org
> Cc: linux-ia64@vger.kernel.org
> Cc: linux-m68k@lists.linux-m68k.org
> Cc: linux-mips@linux-mips.org
> Cc: linux-parisc@vger.kernel.org
> Cc: linux-riscv@lists.infradead.org
> Cc: linux-s390@vger.kernel.org
> Cc: linux-sh@vger.kernel.org
> Cc: linux-snps-arc@lists.infradead.org
> Cc: linux-um@lists.infradead.org
> Cc: linux-xtensa@linux-xtensa.org
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: nios2-dev@lists.rocketboards.org
> Cc: openrisc@lists.librecores.org
> Cc: sparclinux@vger.kernel.org
> Cc: uclinux-h8-devel@lists.sourceforge.jp
> Cc: x86@kernel.org
> Signed-off-by: Dmitry V. Levin <ldv@altlinux.org>

Reviewed-by: Palmer Dabbelt <palmer@sifive.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
