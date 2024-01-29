Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1823CC47422
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jan 2024 08:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rHtjJmYJqAkn2Xvu7F2f7g3RsG4OPd6L9itV77VRK48=; b=TZ+yqgSX58elzB
	HwPt3iLeTGHxB8UnHgI5nCgZYYqeGRy09x/sGm9CMcAd+mIVgvcQYz/iELbR5V83T4/ZCQQkOqJE1
	3J7m1FuokeKoc0k0DWSDUWjhkxKBSeFT1wHGYyQSUzGpvia4JDL/2eI+mTPEKA5+GjpjCNFOW46v4
	pOAfl9Nn8+36Y3V3G1a7O4SWB1tyW4lQoMsBsgtn6uLkmVoPfNML/oZ2iFkT9trUHyI2amC6zkkZH
	7aE2+Fmj6/byPqFb0lIYG+visFotTFcpvCinuelJGuc+7UDCKqbJa6QcsdH5dFy5jr0Vv1wI7P6Sn
	7jMitRt8g/j1DWFSPcig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUN04-0000000Bm9F-3mkl;
	Mon, 29 Jan 2024 08:28:16 +0000
Received: from mail-oa1-f44.google.com ([209.85.160.44])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUN01-0000000Bm8h-2raH
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jan 2024 08:28:15 +0000
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-206689895bfso1488614fac.1
        for <linux-riscv@lists.infradead.org>; Mon, 29 Jan 2024 00:28:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1706516828; x=1707121628; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VTQHhMexm2ZM5TNPgBoAoj25r4Z4mVEM9XexsAZqek8=;
        b=A23vuTvJH/9aTw5NIumZCNTOz78QdXY7zgwGLH6j1Yzs3ZPLUnpAk7gbxKRS9w23gl
         f0x/07togwnhQ32R6/sucsoWvQ82cZEpPQhC4W/XSnWisuRtK4hKGSU7mEI7IrzPpWQj
         3mIdtE55CLTXiQZ6d0bh48Jex3/eV2lmX02mkfaKhL/+JL93FETk3fyHiDzrjYwxRn58
         zJpJbDDFFGxxhBZbC/R5KokDkB0mQ71vPd7sE8sRF2NQ9yGkhVl6e4CSlTMYyi/r8wT1
         jFXAmtpNjqqBJJ5K5YipLNO7z3nRT16jXHk/jkKbjgzChsGgyIxAMK0iT7mJLyc9QdP6
         Eufg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706516828; x=1707121628;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VTQHhMexm2ZM5TNPgBoAoj25r4Z4mVEM9XexsAZqek8=;
        b=WLMy62BSaC/8n1fiUu1TGLiZsxLEji5nsvTz84x1wv5TyPtoMNK0ao3UMP9z+3U+rP
         DHe81/nr5+ytXkXvXpKLDmUdI56dWsvGewn0OCwyrHWVBAKNHMPxmR1rJXxXmvEl6nRs
         xJ3we6LXJfYDferRmPztMx0b6rh39S4KSwWcBD6rctVwjvMVb1Gis6AEzEooozG4HuOW
         PFb3em+X0eEPA5i7/TMffYV1d6soQ1gkTaUYz6njJHNXt/kY99Pl+MKkws8iV+Q6+TQH
         KaDofxYf4Fxg4OtcckCTRj4g7sfhCRuybFjlzHdanMr6G8SA/zm8gmM0emQW0sRTjvBY
         f05w==
X-Gm-Message-State: AOJu0YzRAnZkfm24dLjruR/3QxnmN/7dyqUVEV475yyaztsnEHAtUJi/
	k4tn6/Purz3es00yBlkXd7bFMVg4lhg9JAl+cMAhih3JD3VFxAOc169qpkden/E7Zz1smXyW31H
	9CmvnHEJ15REwTZMhzv/3rLSJQZbucbg/uiSpzw==
X-Google-Smtp-Source: AGHT+IFPLAegwSqjHAvBOCSs83655JR4zi9SYuPyjsFZpCFEJQW3rQNKbNKDzJKKXiyjHErjX/NSRf+SuTel1+/ZIEQ=
X-Received: by 2002:a05:6870:5250:b0:210:da44:c885 with SMTP id
 o16-20020a056870525000b00210da44c885mr2554711oai.45.1706516828322; Mon, 29
 Jan 2024 00:27:08 -0800 (PST)
MIME-Version: 1.0
References: <20240125062044.63344-1-cuiyunhui@bytedance.com> <ZbdYijWK1PnHXn47@xhacker>
In-Reply-To: <ZbdYijWK1PnHXn47@xhacker>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Mon, 29 Jan 2024 16:26:57 +0800
Message-ID: <CAEEQ3wnSN8dLh3FcmHq5yPwQRdjLQa_VjcuTH+7YYZLOqCzaCQ@mail.gmail.com>
Subject: Re: [External] Re: [PATCH] RISC-V: add uniprocessor flush_tlb_range() support
To: Jisheng Zhang <jszhang@kernel.org>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alexghiti@rivosinc.com, samuel.holland@sifive.com, ajones@ventanamicro.com, 
	mchitale@ventanamicro.com, dylan@andestech.com, 
	sergey.matyukevich@syntacore.com, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	apatel@ventanamicro.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_002813_766004_CDA89A15 
X-CRM114-Status: GOOD (  12.01  )
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

SGkgSmlzaGVuZywKCk9uIE1vbiwgSmFuIDI5LCAyMDI0IGF0IDQ6MDLigK9QTSBKaXNoZW5nIFpo
YW5nIDxqc3poYW5nQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gVGh1LCBKYW4gMjUsIDIwMjQg
YXQgMDI6MjA6NDRQTSArMDgwMCwgWXVuaHVpIEN1aSB3cm90ZToKPiA+IEFkZCBzdXBwb3J0IGZv
ciBmbHVzaF90bGJfcmFuZ2UoKSB0byBpbXByb3ZlIFRMQiBwZXJmb3JtYW5jZSBmb3IKPiA+IFVQ
IHN5c3RlbXMuIEluIG9yZGVyIHRvIGF2b2lkIHRoZSBtdXR1YWwgaW5jbHVzaW9uIG9mIHRsYmZs
dXNoLmgKPiA+IGFuZCBodWdldGxiLmgsIHRoZSBVUCBwYXJ0IGlzIGFsc28gaW1wbGVtZW50ZWQg
aW4gdGxiZmx1c2guYy4KPgo+IEhpIFl1bmh1aSwKPgo+IElJUkMsIFNhbXVlbCBzZW50IHNpbWls
YXIgcGF0Y2ggc2VyaWVzIGEgZmV3IHdlZWtzIGFnby4KPgo+IGh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL2xpbnV4LXJpc2N2LzIwMjQwMTAyMjIwMTM0LjMyMjkxNTYtMS1zYW11ZWwuaG9sbGFuZEBz
aWZpdmUuY29tLwo+Cj4gQWZ0ZXIgdGhhdCBzZXJpZXMsIGRvIHlvdSBzdGlsbCBuZWVkIHRoaXMg
cGF0Y2g/CgpUaGFuayB5b3UgZm9yIHlvdXIgcmVtaW5kZXIuIEkgZGlkbid0IGZpbmQgaXQgYmVm
b3JlIEkgbWFpbGVkIG15CnBhdGNoLiBJIGp1c3QgbG9va2VkIGF0IHRoZSBjb250ZW50IG9mIHRo
aXMgcGF0Y2guIEkgdW5kZXJzdGFuZCB0aGF0Cm15IHBhdGNoIGlzIG5lZWRlZC4gRm9yIGEgc2lu
Z2xlIGNvcmUsIGEgbW9yZSBjb25jaXNlIFRMQiBmbHVzaCBsb2dpYwppcyBuZWVkZWQsIGFuZCBp
dCBpcyBoZWxwZnVsIHRvIGltcHJvdmUgcGVyZm9ybWFuY2UuCgpUaGFua3MsCll1bmh1aQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
