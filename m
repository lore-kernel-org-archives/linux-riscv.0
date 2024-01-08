Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69B65C47074
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Jan 2024 03:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NsJDCUj8EWZYOBzl+wbhlCBCUGnCAhrornonoYqsILI=; b=BXYO9YF++7Bzca
	9st8jRY3fV4GVMmifygwrQdjjV/Ur9UAm6eJB9fSHizF4Mkk5H3Tu4xQ3oVdmDq1eb4m2D8Neh6lM
	p4lXo9Pib1itmWU0dRnrILYHS/fChPejTCGjQvXeGFfHrdid3jxHCwoV46VAkBdbIbsyckBr/kwU/
	eT2qn8Guu7eS6ZC+D1eQHfgNLkm/QBf0rLrJg4V5JRbEvpZcB+JEFPjAZAXWboEKyfNrwXqF/wnsn
	35XzcHWs7dWaN4MxCcTGK0rt2DyUmos+qgJ58I46sfCVv8mpt8imr3RxGKSsfuOAGZHdP1hf5QkyI
	HxMGZg+f0kzAlC4g5YSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rMg85-003tLw-0W;
	Mon, 08 Jan 2024 03:16:45 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rMg82-003tLF-07
	for linux-riscv@lists.infradead.org;
	Mon, 08 Jan 2024 03:16:43 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-50ea9daac4cso1232476e87.3
        for <linux-riscv@lists.infradead.org>; Sun, 07 Jan 2024 19:16:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1704683799; x=1705288599; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6kLQp7xYz1C8iGbmJWG1vLPOwloZEvkMGGSVW6B2aGE=;
        b=V6Rj7axTG9pHen59cY15Sc5clOwoqlt/PlElLicPlgExJXy75aekOXmGavd0E8TMLH
         4fXWWNDWR78UpYtA4w/D4l4RNz8DifACWHM1XSWoVtx/qMpznGzXCezar80AII7C2Z5+
         oY285txSWa/7y8RWEWDZqnzKrIrsKODOM5wKIPty8S+vSZnsnt+tLfnEGjdA48gPBu6E
         nfyQof0QV7jib/NLOMAb+1nc6Bn3mXEu3wWgQWEQEM9b/UKsigLwRxeJvnRwSlX9h6RK
         N77FwfwJRXyIWlsJF1W9HipPLN8ia3gOaVdED4yRbP/yXN+6nwEc4hheeLoTOhMa27Qj
         uD9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704683799; x=1705288599;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6kLQp7xYz1C8iGbmJWG1vLPOwloZEvkMGGSVW6B2aGE=;
        b=ZEho8yENkyGAh8E8ZHjaofjBTL8DiutQADO4xhwFmvB9OeaKiaXI4knQNhVwTb2+ns
         mwYlWJtYFuokcDP2mEaYnF4U5aqHSxcZYINRHIlggRTfiHyt53wa3+wQvgnrDdh/gYtV
         ijdcOzk3g2/yfZcdhL59lDdbHMrzpugNlTSW31xfkvpLOgfCV2dlSti0e51rTUDjDxUG
         Uy78Jc8VlMNEBX3y8juUORjgFZVv4TP+MjXvOhJg5nEb5+wW7kU9y7gI/I/E1RVyRc26
         C0CADnYMTNdmj+p08nRWWVvRyi/3ZOAiDQyshMJUEZkE5fvQFDEHz6HSo6ohGO5415jt
         bCJg==
X-Gm-Message-State: AOJu0YwxlXTU094fRyE/BK1f5g7MIE56aANGFtRlZ9CaGGZ/QwdhPj96
	PSXggB2+/MTHnGTvgYxHtJObHrbp1l7qn9V/RoWbO4Bf9CNKvQ==
X-Google-Smtp-Source: AGHT+IFxkMnH7ltX7nW7tZBejEUlepXuxhdGIninzCDBlNlClltnuKL8OQzsNSHxZDvNvXt4syDYfdwTgB8Szoj8OSY=
X-Received: by 2002:ac2:4885:0:b0:50e:a9da:7b2b with SMTP id
 x5-20020ac24885000000b0050ea9da7b2bmr971537lfc.94.1704683799292; Sun, 07 Jan
 2024 19:16:39 -0800 (PST)
MIME-Version: 1.0
References: <20231229143627.22898-1-andy.chiu@sifive.com> <20240105185920.GA25631@sol.localdomain>
In-Reply-To: <20240105185920.GA25631@sol.localdomain>
From: Andy Chiu <andy.chiu@sifive.com>
Date: Mon, 8 Jan 2024 11:16:27 +0800
Message-ID: <CABgGipUgQS85P-PDRg9CF8LW6=VRfUVz_GJ4pZTfQN8gpB+-qA@mail.gmail.com>
Subject: Re: [v9, 00/10] riscv: support kernel-mode Vector
To: Eric Biggers <ebiggers@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	paul.walmsley@sifive.com, greentime.hu@sifive.com, guoren@linux.alibaba.com, 
	bjorn@kernel.org, charlie@rivosinc.com, ardb@kernel.org, arnd@arndb.de, 
	peterz@infradead.org, tglx@linutronix.de, Albert Ou <aou@eecs.berkeley.edu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240107_191642_128947_F3224D0D 
X-CRM114-Status: GOOD (  12.29  )
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

T24gU2F0LCBKYW4gNiwgMjAyNCBhdCAyOjU54oCvQU0gRXJpYyBCaWdnZXJzIDxlYmlnZ2Vyc0Br
ZXJuZWwub3JnPiB3cm90ZToKPgo+IEhpIFBhbG1lciwKPgo+IE9uIEZyaSwgRGVjIDI5LCAyMDIz
IGF0IDAyOjM2OjE3UE0gKzAwMDAsIEFuZHkgQ2hpdSB3cm90ZToKPiA+IFRoaXMgc2VyaWVzIHBy
b3ZpZGVzIHN1cHBvcnQgcnVubmluZyBWZWN0b3IgaW4ga2VybmVsIG1vZGUuCj4KPiBJcyB0aGVy
ZSBhbnkgY2hhbmNlIHRoYXQgeW91IGNhbiB0YWtlIHBhdGNoZXMgMSBhbmQgMiBvZiB0aGlzIHNl
cmllcyB2aWEgdGhlCj4gUklTQy1WIHRyZWUgZm9yIHY2Ljg/ICBUaGUgdmVjdG9yIGNyeXB0byBw
YXRjaHNldCBkZXBlbmRzIG9uIHRob3NlIHR3byBwYXRjaGVzLgoKUGF0Y2ggNCBpcyB2ZXJ5IGVz
c2VudGlhbCBmb3Igbm9uLXByZWVtcHRpYmxlIGtlcm5lbC1tb2RlIFZlY3RvciwKdW5sZXNzIHdl
IHdhbnQgdG8gYmVhciByZXN0b3Jpbmcgb3ZlcmhlYWQgYXQgZWFjaCBrZXJuZWxfdmVjdG9yX2Vu
ZCgpLgpJdCdzIH4yMDAgY3ljbGVzIG9uIGEgVkxFTj0xMjggaGFyZHdhcmUuIEl0IGhhcHBlbnMg
YXMgbG9uZyBhcyBWZWN0b3IKaXMgYWxzbyB1c2VkIGluIHVzZXItbW9kZSwgd2hpY2ggd2lsbCBi
ZSB2ZXJ5IGNvbW1vbi4gUGxlYXNlIGNvbnNpZGVyCmluY2x1ZGluZyB1cCB0byBwYXRjaCA0IGlm
IHdlIG11c3Qgc3BsaXQuCgo+Cj4gVGhhbmtzLAo+Cj4gLSBFcmljCgpUaGFua3MsCkFuZHkKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
