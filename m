Return-Path: <SRS0=E0x1=NQ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84DD4C0044C
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  5 Nov 2018 14:51:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 52B2220685
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  5 Nov 2018 14:51:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fwt/uC2V";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qozndlnw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 52B2220685
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=BIQzww/IvAEB7w5DxoNt5QWzjGVbJcPM1W13qdGeDo8=; b=fwt
	/uC2VU+/sc2hFQwJqBadhXL4O00EsJAbljyIj0e4mGgJx2Yses02Ze6836y9W9H44Dy0NOoYU7j+g
	NTS3bdRQl6lIAo12gQf0o5b9G/Qk6SsqcH4OZrV8PtwCEMLVmw0HQF8selAFJMuf8fXCjcRpfyvU5
	aZr8CeyNJ16nva6LaXw9VO+rSYUZqipA1n2KtU2uqNoT1eBkF1y7PH489wKmJEGxOfZHBL5zxt55y
	XcZv6rDPxdOB++w7csbgzQ0dkiK3qmpWWj9Tn+hGOwPoN4VdZAIpgwHmVjJrLBjHw128Fo3KYdUM5
	wETB3vSUToaeqEqJPaLIYtyymLi7yvQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gJgDy-0007ng-6J; Mon, 05 Nov 2018 14:51:30 +0000
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gJgDv-0007mk-GT
 for linux-riscv@lists.infradead.org; Mon, 05 Nov 2018 14:51:28 +0000
Received: by mail-ot1-x336.google.com with SMTP id t5so4558990otk.1
 for <linux-riscv@lists.infradead.org>; Mon, 05 Nov 2018 06:51:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=eijKzS/Z1JIDZ1ITLPrjR9rXWaGUHUMA5WufczCJdKo=;
 b=qozndlnwLF6w0Z0CWdqI7Y279JZfrSfgjviihWG3qCWreKafTZel2DMuvIaa4/As+V
 4o1mDSxT5ES6OSzGgPI6NWb3QFVjHPCRYP4Nc4Gm3ZP5528QO7Yj0SgdR0wQezcLt/ii
 AsXMJOVrKaWeih0dKuCOnReXcxB4d9yCMKLrkLiU5WkHkxypYop/9cLnyhHVDSkj86RJ
 XE/5eNueO5SSBXIWEx18V37Np4PvpdXEj04p1R56CtiMpYRlFBDubfLrokhGM/9b6Yia
 QzCENnsAFE3TddSuJCbF6/JaMy4vMNsNiDmlvtBj2Cl2I4CNN6WzLBVzY9gpfuQMwLYx
 oOPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=eijKzS/Z1JIDZ1ITLPrjR9rXWaGUHUMA5WufczCJdKo=;
 b=Hz4vig4B+4LKal3buEElaEiTMKHZxG+/SEXF0v99ky+VnB+QB+eJB0OVfhcqwDGTCk
 nVOc9XroCKFd8SbLM8KONvqd5SL9q3VGEUseg+DYx9Frb9AF2GU+3E2nNXucuVPkNRdw
 kDzoAHBtOF9MRh78XTYVnA0nH3WXcLH9B6zcBHsEpn3qi1Dshzi5xWmAZbj6SuhIEDys
 h8zYkE2F9J1wVVMTbBmfpn5GMPiBCrfmOFoxhCZ2J5xMhe2eaCeW0SZpS9UETny2fsZC
 Xy6gF9oReLtQ0n6nE7BWMn8PJ76EDXFRisyeOVevx5FNZWwqziWv+6Ket2WOK+/RCpzd
 biog==
X-Gm-Message-State: AGRZ1gKsmts8fZQgTrEWbCvfCmoLuvCBpvRKjcjvQW/IcHeSrXTNW9/d
 ONjhRZAiqIUDocqPpvpBGewNbJUA4uZnS1OBZDtOUaZni+M=
X-Google-Smtp-Source: AJdET5dtMXepV5jhIw+187qDelqBYn80AlJbYuoEE4WSx0EJmyqQrQ3G8la3kjD1AUIxTnVj/SNWEJuUFnUU8mbLON4=
X-Received: by 2002:a9d:dc3:: with SMTP id 61mr4926785ots.345.1541429475188;
 Mon, 05 Nov 2018 06:51:15 -0800 (PST)
MIME-Version: 1.0
From: David Abdurachmanov <david.abdurachmanov@gmail.com>
Date: Mon, 5 Nov 2018 15:51:04 +0100
Message-ID:
 <CAEn-LToUoaA0H=_boLUi6SPXyo5Wfge293GbOhgxw2-JcZDKmg@mail.gmail.com>
Subject: warning in ./arch/riscv/include/asm/module.h
To: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181105_065127_577165_F1FF68CC 
X-CRM114-Status: UNSURE (   3.52  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181105145104.Ke8eEWbzC_ogjZOCIMyj88M9dP3oRz3hubOjFZ_zlfU@z>

Hi,

This happens once you enable "Module signature verification". E.g.,

[..]
CONFIG_MODULE_SIG=y
CONFIG_MODULE_SIG_ALL=y
CONFIG_MODULE_SIG_SHA256=y
CONFIG_MODULE_SIG_HASH="sha256"
CONFIG_MODULE_SIG_KEY="certs/signing_key.pem"
[..]

BUILDSTDERR: In file included from kernel/module-internal.h:13,
BUILDSTDERR:                  from kernel/module_signing.c:17:
BUILDSTDERR: ./arch/riscv/include/asm/module.h:11:34: warning: 'struct
module' declared inside parameter list will not be visible outside of
this definition or declaration
BUILDSTDERR:  u64 module_emit_got_entry(struct module *mod, u64 val);
BUILDSTDERR:                                   ^~~~~~
BUILDSTDERR: ./arch/riscv/include/asm/module.h:12:34: warning: 'struct
module' declared inside parameter list will not be visible outside of
this definition or declaration
BUILDSTDERR:  u64 module_emit_plt_entry(struct module *mod, u64 val);
BUILDSTDERR:                                   ^~~~~~
BUILDSTDERR: net/core/rtnetlink.c: In function 'rtnl_newlink':
BUILDSTDERR: net/core/rtnetlink.c:3224:1: warning: the frame size of
1280 bytes is larger than 1024 bytes [-Wframe-larger-than=]
BUILDSTDERR:  }
BUILDSTDERR:  ^

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
