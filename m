Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14C33CD13CF
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Sep 2024 08:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8MpjqtpVWP4l0+HeVuiRyh1UvHNWqJhf/7vzsNxSxfk=; b=A7GnvZvuyhI+I9
	NBLpg8zZVx/QFcULtDk1ZYcuWCJdIHPySD4vgt+lG2YxkRdVtTMKMzLQvjSI2GnMKGi3Y5AhN2dHK
	NomD9Ig+AEnEqmBi6Lhe7wnwhSG64ZotTDmUQZDXh+8MSHLFreGsL1Tz3knft3lXF5p6VnbDCpLlS
	yQCPt5amLqbQQXSA4jif51ys2bfsbBJ8eryymN5h4JZjXZjsoT3OvmHqhG7xrH08jetRRiuNnI5rG
	spM8uVjll6vPHBCiCOeoW5SE6SWs2791a/JO2ZO4iAXyybKjRY0HvIJWvzGCnWVgZBHbJIj2k1aad
	xtosdeZ4vSdOwT/sKo/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sl2Q5-0000000DVKd-2Fcv;
	Mon, 02 Sep 2024 08:28:17 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sl2Op-0000000DV0f-1swl
	for linux-riscv@lists.infradead.org;
	Mon, 02 Sep 2024 08:27:00 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2f3fea6a0a9so35034211fa.0
        for <linux-riscv@lists.infradead.org>; Mon, 02 Sep 2024 01:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725265617; x=1725870417; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8gqoKM1aect4l0xgmZSyLQOJVqgjUZqiT8L6Ldx5788=;
        b=qH6+GtNBFGuWJth8A36EUdGiwvb2aUGvwdQA6tfpmzYlSowpexfYnh41zY3wT5CL/i
         C0DokjlZoe0lzxEtrWWnStK13elXYV2c1JGyK0tAGkZEqv0R9lcac1r4WdnJtHGvo+nm
         tBX1HTgwNOH/j5Ulhd98Mn5CIbUIBQjnvkX4wzqdfkQBN2uYOUYQgDWr3o4rLtBxPLVE
         GZYZKrDBv+gEJ6ENsaTQyttulafEga2PtdrgW2/nK0IZJPHLN1k4RT+elJ8ochlGX7LI
         KVkFrILRmQ9ETE4HwHt+y92DPRWZKfeZX0D9LIAPUzjxkZBUbduDasemtx8f3+ug6oJu
         nrLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725265617; x=1725870417;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8gqoKM1aect4l0xgmZSyLQOJVqgjUZqiT8L6Ldx5788=;
        b=SNe6BG6M7Rm+ZsxPh5ibBaOYVPluenWPAeqK/TPIlpKt/zB+Gl/K9F8YWfAvKoqIWj
         GckF70X8tEDMkd4lwi88umWB4YzGYOEQMG7Nrdw80ZFGwIW/18yitdC4P8g16+VgPAkS
         PXNSJV+pyCV21uaND2CqUAlyzu980UbS3MM3zbCECSthyzwwxwnUECdVPVX7ApYSGNrn
         qudFOnuTGUQNb51r5pRcpI9wTHa766bfx5Etr8iEoIlY7TpYBBTR+1encOCagDpVZLGy
         BUckuWJ2a2L9uBY3/AARDMm13OIPqtp2242u7ec3m0Jb1ZfZZS53Adk3IAaU17koWNnY
         Nqwg==
X-Forwarded-Encrypted: i=1; AJvYcCXjyUtLvZJssRPFINoEPjjl/rPyzEVPT5Bl/TB9l6pmr4pJF/z+tYjohkwxdj2sLLjYCE6VFNSYK4B+7A==@lists.infradead.org
X-Gm-Message-State: AOJu0YzzxNuKljLQ/t2pcN82agdaFUFPWaTHtJ2ULqFLDdCTS8GNyRIf
	5s5MugaBHcSF4cqyDmy7j6AKRWaJUZNU1mAwoEuC6De1z47ctmGMABtl3cVWOPAJO7NQARpxCjQ
	wcYj0r4i0/6tPLQ7IVrsJzyn2d/1WLIqA4bjQ/g==
X-Google-Smtp-Source: AGHT+IE19as9qXHa80m04976+p4Hw7/SgTBETcs9158iDLNlM7aXWSyyuCdphZi5UDS6RxRBqwZgoqzaVDQwX8yRgX4=
X-Received: by 2002:a05:651c:2209:b0:2f3:ac23:b1db with SMTP id
 38308e7fff4ca-2f61299d997mr48523101fa.4.1725265616566; Mon, 02 Sep 2024
 01:26:56 -0700 (PDT)
MIME-Version: 1.0
References: <20240829064938.20114-1-wangjianzheng@vivo.com>
In-Reply-To: <20240829064938.20114-1-wangjianzheng@vivo.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 2 Sep 2024 10:26:45 +0200
Message-ID: <CACRpkdZc2L2jLufmfrWzqCp3A4oS8w+K6oD+FNyX5pJvE3aw-w@mail.gmail.com>
Subject: Re: [PATCH 4/5] pinctrl: k210: Use devm_clk_get_enabled() helpers
To: Wang Jianzheng <wangjianzheng@vivo.com>
Cc: Damien Le Moal <dlemoal@kernel.org>, 
	"open list:CANAAN/KENDRYTE K210 SOC FPIOA DRIVER" <linux-riscv@lists.infradead.org>, 
	"open list:CANAAN/KENDRYTE K210 SOC FPIOA DRIVER" <linux-gpio@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	opensource.kernel@vivo.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240902_012659_509908_E387D71E 
X-CRM114-Status: UNSURE (   9.12  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBBdWcgMjksIDIwMjQgYXQgODo0OeKAr0FNIFdhbmcgSmlhbnpoZW5nIDx3YW5namlh
bnpoZW5nQHZpdm8uY29tPiB3cm90ZToKCj4gVGhlIGRldm1fY2xrX2dldF9lbmFibGVkKCkgaGVs
cGVyczoKPiAgICAgLSBjYWxsIGRldm1fY2xrX2dldCgpCj4gICAgIC0gY2FsbCBjbGtfcHJlcGFy
ZV9lbmFibGUoKSBhbmQgcmVnaXN0ZXIgd2hhdCBpcyBuZWVkZWQgaW4gb3JkZXIgdG8KPiAgICAg
IGNhbGwgY2xrX2Rpc2FibGVfdW5wcmVwYXJlKCkgd2hlbiBuZWVkZWQsIGFzIGEgbWFuYWdlZCBy
ZXNvdXJjZS4KPgo+IFRoaXMgc2ltcGxpZmllcyB0aGUgY29kZSBhbmQgYXZvaWRzIHRoZSBjYWxs
cyB0byBjbGtfZGlzYWJsZV91bnByZXBhcmUoKS4KPgo+IFNpZ25lZC1vZmYtYnk6IFdhbmcgSmlh
bnpoZW5nIDx3YW5namlhbnpoZW5nQHZpdm8uY29tPgoKUGF0Y2ggYXBwbGllZCEKCllvdXJzLApM
aW51cyBXYWxsZWlqCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
