Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53491C0015E
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Aug 2023 23:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YKbl+9A6bYKRV1BR0a9bwYZNkYdmR++ho0gSQllXAJ8=; b=QR2Ceow2M9JEGg
	JHNx1V5w2+qttLnnbHvtpi3aAbd4ULSZmuQVv76oCkVrigeArPjX9uOTTEY9N+mITTvFB2dt4oAXJ
	RIehBP0n2hB+l628gVi9XrARbqikDCm+AP5h4KqCFiWuBZRXb77sgUIwI8o28lhZRhRtcULM919Hk
	rE6mi8Gv9h18iLA7fa/ZUW4RXodxrCjtaWddduS79IQgZFGh2AXdbnsS6+/3srRXwSaZr4BRZRiFi
	dkjBJCEZ3kchBAhaydinGdyzGbUgD5DR8HAY4mE2dVMdwrh607Sl7PeG0/F3WxMC6Wdo1yadTZcSL
	O9zsxSPtVbfLUHIIhaHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQyNp-003UMb-06;
	Tue, 01 Aug 2023 23:02:29 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQyNm-003ULw-2J
	for linux-riscv@lists.infradead.org;
	Tue, 01 Aug 2023 23:02:28 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-3fb4146e8deso67863535e9.0
        for <linux-riscv@lists.infradead.org>; Tue, 01 Aug 2023 16:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user; t=1690930944; x=1691535744;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YiGr6RseLN//FLKBr95vV+LBX/ZbUD8quF/4QlFb37Y=;
        b=dsZm6jk7cno+vap3O9XWb4T6aTUIHR5BPs8Yl5G0uuTns5GkM5M9r/xyPKq24OmtqT
         sL0hDjxr86Psu30p+caJWGwnCEe5TlaoRFPCjzIXLYljU0/WkVZpiSttoBddIPLt1r6l
         38ETeBejgcLVYRJKo3Kijzq9WglSr0FK4F9WItQN9sxNxE/TVvOomiqbULu+bWJBrzOm
         dVmpcegdqRjIswEjNpzNN65hjF5NYrKwOinMrsvZNS/sTgsXZTiedOb7AFV+QMMR/0fW
         4/XNVhRuPBwayErpZuS3TFsugis5e+D1tDR4JSJRWGDejW3A4wXpJqSPYVM/8qKSUlz2
         rqpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690930944; x=1691535744;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YiGr6RseLN//FLKBr95vV+LBX/ZbUD8quF/4QlFb37Y=;
        b=ZrGwL3pVteIX0CTdK8M8784W5yRL2RH1wKOqaavfaWGtyLiAP3ZMcyLfVOMx8vsE5H
         VN9xGSNWuoBNdugqJaKtF8/Fa4OVZRwzo1rXSMs5zWRvBwhFEwdz3ULMH+YhsHKZAoqa
         PIH4VX7yWw99ER8u369x4Ow4orBo67vZ8o5qnhBYTrdXYXNYX68KSK4/sQ1owKFplGfl
         lMUgjEi9dxOHUFHcPiFrkgLD2asVdLzlLOc8q6tMqE1UhqjxK74quvlIJtTAl8nFCikN
         BmwLi9TPx4qFtoHJR5UxErDRRXOJlzMVVq/Jxbj9NYaWarZ3lMgTqIrwIOd5KUDO6QIh
         QZaA==
X-Gm-Message-State: ABy/qLa45Lle0nz4/7VFdGcO6j6cdKpPNIq0dulkCNdY5qDpmq6cy7IW
	QP5EIoJDDC2yd77CwFF2oTY75g==
X-Google-Smtp-Source: APBJJlE1qO/mz5cEVBdCi3bzPv1ACuaaM2Oq9Lj87enYg2180oHHHM3WQBmc1aVGukuCLwKJTbvFyQ==
X-Received: by 2002:a05:6000:11cd:b0:317:59df:a848 with SMTP id i13-20020a05600011cd00b0031759dfa848mr3362765wrx.30.1690930943800;
        Tue, 01 Aug 2023 16:02:23 -0700 (PDT)
Received: from smtpclient.apple ([131.111.5.246])
        by smtp.gmail.com with ESMTPSA id m13-20020a7bca4d000000b003fa96fe2bd9sm126620wml.22.2023.08.01.16.02.23
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 01 Aug 2023 16:02:23 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.600.7\))
Subject: Re: [PATCH] RISC-V: cpu: refactor deprecated strncpy
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <20230801-arch-riscv-kernel-v1-1-2b3f2dc0bc61@google.com>
Date: Wed, 2 Aug 2023 00:02:11 +0100
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Kees Cook <keescook@chromium.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 linux-hardening@vger.kernel.org
Message-Id: <61DD603A-3D86-462F-B795-7EDE3A59ABBE@jrtc27.com>
References: <20230801-arch-riscv-kernel-v1-1-2b3f2dc0bc61@google.com>
To: Justin Stitt <justinstitt@google.com>
X-Mailer: Apple Mail (2.3731.600.7)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230801_160226_839970_8983FC15 
X-CRM114-Status: GOOD (  17.09  )
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

T24gMSBBdWcgMjAyMywgYXQgMjI6MTQsIEp1c3RpbiBTdGl0dCA8anVzdGluc3RpdHRAZ29vZ2xl
LmNvbT4gd3JvdGU6Cj4gCj4gYHN0cm5jcHlgIGlzIGRlcHJlY2F0ZWQgZm9yIHVzZSBvbiBOVUwt
dGVybWluYXRlZCBkZXN0aW5hdGlvbiBzdHJpbmdzIFsxXS4KPiAKPiBBIHN1aXRhYmxlIHJlcGxh
Y2VtZW50IGlzIGBzdHJzY3B5YCBbMl0gZHVlIHRvIHRoZSBmYWN0IHRoYXQgaXQKPiBndWFyYW50
ZWVzIE5VTC10ZXJtaW5hdGlvbiBvbiBpdHMgZGVzdGluYXRpb24gYnVmZmVyIGFyZ3VtZW50IHdo
aWNoIGlzCj4gX25vdF8gdGhlIGNhc2UgZm9yIGBzdHJuY3B5YCEKPiAKPiBUaGUgYHN2X3R5cGVg
IGJ1ZmZlciBpcyBkZWNsYXJlZCB3aXRoIGEgc2l6ZSBvZiAxNiB3aGljaCBpcyB0aGVuCj4gZm9s
bG93ZWQgYnkgc29tZSBgc3RybmNweWAgY2FsbHMgdG8gcG9wdWxhdGUgdGhlIGJ1ZmZlciB3aXRo
IG9uZSBvZjoKPiAic3YzMiIsICJzdjU3IiwgInN2NDgiLCAic3YzOSIgb3IgIm5vbmUiLiBIYXJk
LWNvZGluZyB0aGUgbWF4IGxlbmd0aCBhcyA1IGlzCj4gZXJyb3ItcHJvbmUgYW5kIGludm9sdmVz
IGNvdW50aW5nIHRoZSBudW1iZXIgb2YgY2hhcmFjdGVycyAoYW5kCj4gaG9wZWZ1bGx5IG5vdCBm
b3JnZXR0aW5nIHRvIGNvdW50IHRoZSBOVUwtYnl0ZSkgaW4gdGhlIHJhdyBzdHJpbmcuCj4gCj4g
VXNpbmcgYSBwcmUtZGV0ZXJtaW5lZCBtYXggbGVuZ3RoIGluIGNvbWJpbmF0aW9uIHdpdGggYHN0
cnNjcHlgIHByb3ZpZGVzCj4gYSBjbGVhbmVyLCBsZXNzIGVycm9yLXByb25lIGFzIHdlbGwgYXMg
YSBsZXNzIGFtYmlndW91cyBpbXBsZW1lbnRhdGlvbi4KPiBgc3Ryc2NweWAgZ3VhcmFudGVlcyB0
aGF0IGl0J3MgZGVzdGluYXRpb24gYnVmZmVyIGlzIE5VTC10ZXJtaW5hdGVkIGV2ZW4KPiBpZiBp
dCdzIHNvdXJjZSBhcmd1bWVudCBleGNlZWRzIHRoZSBtYXggbGVuZ3RoIGFzIGRlZmluZWQgYnkg
dGhlIHRoaXJkCj4gYXJndW1lbnQuCgpJIHdvdWxkIGltYWdpbmUgeW914oCZZCB3YW50IGEgQlVH
X09OKCkgcmF0aGVyIHRoYW4gc2lsZW50IHRydW5jYXRpb24gaWYKdGhhdCBldmVyIGhhcHBlbmVk
ICh3ZWxsLCBzaWxlbnQgaWYgeW91IGlnbm9yZSBpdCB0aGVuIHByaW50aW5nIHRoZQp0cnVuY2F0
ZWQgc3RyaW5nKS4KClRob3VnaCByZWFsbHkgeW91IGp1c3Qgd2FudCBhIHN0YXRpY19zdHJjcHkg
dGhhdCBsb29rcyBhdCBzaXplb2YqIGZvcgpzb3VyY2UgYW5kIGRlc3RpbmF0aW9uIGFuZCBmYWls
cyB0byBidWlsZCBpZiBpdCBkb2VzbuKAmXQgZml0OyB0aGVyZeKAmXMgbm8KcmVhc29uIHRoaXMg
bmVlZHMgdG8gYmUgZm91bmQgYXQgcnVuIHRpbWUuCgooKiBhbmQgX19idWlsdGluX3R5cGVzX2Nv
bXBhdGlibGVfcChjaGFyW10sIC4uLikpCgpKZXNzCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
