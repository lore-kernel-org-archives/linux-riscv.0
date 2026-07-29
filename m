Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C491CC53200
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jul 2026 16:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BMoEBkbLEMEL9NYQb8kRF7nwY1XV3lpkNeW9LkHfSck=; b=3KkjvhvtLlrZ7X
	46siceoJJY1Typ7E7Q8B2wijEMQVict3qylL8n7qW+OGYPcS2DZd09RkjRw3DzXDxSgh5s35437kl
	il+OS1bMigjG0hlJgs9sL23wprxYbauUmEWxKvCsTQ9EU/ke898HARqpvR8AwT96Tr84Sa6vwQLpc
	JD3qvZX3oMeu3p2S6npJos9ds0JudGgkAftnICMWeHJ0bMrZemCfYwstKwBMYValDAvnFSOH+ZuCH
	XRoSlsSjrsdWvimcTJBEaBLT+QIYyn9RotnyshI2mAeMpR4q9n7qtTQzGTXVpmCelDSksfWcyxZuw
	o4YcujlMje18qA9zB3CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp6nf-00000008Umm-02oA;
	Wed, 29 Jul 2026 16:06:31 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp6nc-00000008Uly-3wDI
	for linux-riscv@lists.infradead.org;
	Wed, 29 Jul 2026 16:06:30 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-47f707e5d75so831389f8f.1
        for <linux-riscv@lists.infradead.org>; Wed, 29 Jul 2026 09:06:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785341187; cv=none;
        d=google.com; s=arc-20260327;
        b=YefwlujqF+BHPHdQIEbcV7DTAQu3UDud28AcLH7LIJ4FnGXlCgskcGcFTpCJr90Hvl
         YfzPw9kv1iheXC4B88/1EcV9yI3fqpe0HIlZwI9uK6NPFvpTNpvyvjXPDLD1bXEC0rUf
         aKmJNhjjLFatgcT2jGJdQ9tZj6m7K0RjSjgQU1swuWp5dV40avGKZrgLvkTXQPnL9cQc
         IqvfRh0fe5N1/PjVEWvuPMoMalS9iSMWue0yGifYOKnop1Z1uQ4h4997MhmYsB2Dd8hl
         lJ74jmRDRmNlmcMYn6N65gTCFaZT49q79s0DqWhypHbyqPhYwDwFFaC1plrnwzXbjWq6
         o2gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PZCxNpAkNUCXAcRdhLTO0d6tb8+6Q3Nj0sfDnYlByPI=;
        fh=6zw/7B8+HzXyPXoeo/QtJ5+u2XbkCV+ZnwkMIIMfb3k=;
        b=JsAqEb5sxiTTHIl1PMFzWJgtQitJ0o1edYKgsfwjpzByPHr6r2fA+qdKaVTynnQPam
         icjXrzTl7X4FYqikwigUvFv+w8Z9xz45grn/PfUpqZfxpjFy5QJcLrs0Qpf4Y36NpsOT
         XZtxDexCN4ZU5Ff3bsC0izl5dNndUZ9UqA16usqmHt6QzNK3Ofms/33f2gRsPpPna4bH
         xzve2p1ka7CQpJYcdmieb70VV/Q0r9GzYKHPuo4eQ8vVKXq8TT/V3Vt5vlDG71HN4CTF
         wliu5zd67wPrg/AV/MS8NgBVLtmHrg0Q1eDeWKmALqHD/5iLbslyctxvR/bsl7g5TJa1
         elfA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1785341187; x=1785945987; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PZCxNpAkNUCXAcRdhLTO0d6tb8+6Q3Nj0sfDnYlByPI=;
        b=LbUDYPv+4r0GlD0/cLDUn5ToKQ4jIrEeOu9mY6j7a+FF0lUt47d6uVrm1MNUMSqkuw
         sB50MTeZFNdUA39AEO0cTDZ6irIX/T0QpGaKDj0OYsb6fmBA8GFeHpDS3LeZZtnDWpH1
         iAXOha+pvZyW2QWzkfeDHtrWDg2kTtpbJgnqcBzTWN4b/zV9mUE7SEfMqUG+R10FAfC9
         GiZ5CucoB8h5T2ZesiKwQwMpSv8AlZWvKV20ioGfv8nUXHW1honZvarGcRVriBB8srl/
         ye+rqW+Awlrr8XDzlyLyIIT0Fr90Jc5TgKr1uS654JDlj62al6VzC3fNj24+yY072gvI
         FPJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785341187; x=1785945987;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PZCxNpAkNUCXAcRdhLTO0d6tb8+6Q3Nj0sfDnYlByPI=;
        b=VNolx1IC/mtCi/ineToc76IF7A0DKxUCtNythCU8hjZNOBtOfwaD4XDbXakQK9HVGa
         zq1dKVQqvzRA77R7XvKGo4DhKaIh+ocXgYD6hUy73ZZ4rc3S7bEeG2MRZTzuuyOekwYB
         1/U3sHPwoAXGOxgN5ccBcK2xeg3t0WI7dWB1QeybV5IUc0iiCZ4XlHp50qYamZLfMUf/
         kryAI54vog+JY/ODxB6O+bsvfX3s1EzZvAnHhkfwYFlk729MYYE3XfWjqNhezllmtAgo
         VnwJCTteQ2bMIWiz75rukeQ9qykm64RtHytfhxO8SjeexyIdSwTLnVq4ZsYS7orD4DSA
         bvfg==
X-Forwarded-Encrypted: i=1; AHgh+RqWDJ0+u5r6kmTdAcRVsHBCHY6VU2U62hgsK6JB15CXiDN4qEtvNpt3sPTrWOxJUvlddR4GtQhdpBSqjw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxk4RlpdyZZ+j8AX32qumQx/jmtElzHChVQ+uX+vBIW21PBStIa
	3GKvbIOO1r8DpyfezIFzXLfmsOEan4fSFno1hUX6t+e2IolVgjr7ZmHEJOcF8cDJUvsCXmxnGPd
	R6Kq7h2Ro/Cxod4Ha7REvJoeCaG9iHvbKcgWD8Ydsqqg+/MvjTxOieB72Bvn1
X-Gm-Gg: AR+sD10+rKFb75lwrMJo7MRH6Gpo/aE33GrvDmdYh/ekGmm8gKTMZWJEKq2zd8yUyP/
	mG0zAIujzJZZBlPhdkbBlp/jLIGqDyXmOkI1Ja3w+1hFybLqG5ZKT7FtfOSm8QUfBCNykEMeJ2f
	5jVzbZdJg6QM6/W1O6Nvr0/e35mli8vQiAGEhg3VYDBJQqahQvfYkYENGdRJmn9pGR7Ysx7S6lH
	wgHPSyyAP8qtChOiMshbVfHfwwJnw1hkcNUN994tKggrRzwlyQ6cFZ/TB8kSmGVDiznIuhGOrtB
	m8yljbFPHE4GvGGmVoyK3yJtoXggKGHutmw1teLlxGTIBuNIJoGuhjajyFhz3ke1EFVKyeboJXs
	Shb0xyRUKbSyLPM3rvu59u5lfnwv2ILgtuvbCSLgg1+ZgNA2c7y2PwOrxlC0QIhv2
X-Received: by 2002:a05:600c:8b2e:b0:495:6e68:39bd with SMTP id
 5b1f17b1804b1-496c6597a0fmr96285485e9.28.1785341186425; Wed, 29 Jul 2026
 09:06:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260729075230.743030-1-shanbeeyoo@gmail.com> <20260729120733.829457-1-shanbeeyoo@gmail.com>
 <20260729120733.829457-2-shanbeeyoo@gmail.com>
In-Reply-To: <20260729120733.829457-2-shanbeeyoo@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 29 Jul 2026 21:36:14 +0530
X-Gm-Features: AUfX_mwiSOUOFP2TPHe4Inq1CQye-PgTV4ubVFK-FDwozFalkW3VgzVL7PEKoxM
Message-ID: <CAAhSdy3ziS_1iiUjC5HSVqX9iMgckyS7Yro=xwZyomxXC=MC7w@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] RISC-V: KVM: Treat -EEXIST from G-stage map as success
To: "Bingyu.Xian" <shanbeeyoo@gmail.com>
Cc: Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Quan Zhou <zhouquan@iscas.ac.cn>, stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_090629_093028_6190BC56 
X-CRM114-Status: GOOD (  21.63  )
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

T24gV2VkLCBKdWwgMjksIDIwMjYgYXQgNTozN+KAr1BNIEJpbmd5dS5YaWFuIDxzaGFuYmVleW9v
QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBXaGVuIGEgY29uY3VycmVudCB2Q1BVIGluc3RhbGxzIHRo
ZSBzYW1lIEctc3RhZ2UgbWFwcGluZyB3aGlsZSB3ZSBhcmUKPiB3YWl0aW5nIGZvciBtbXVfbG9j
aywga3ZtX3Jpc2N2X2dzdGFnZV9tYXBfcGFnZSgpIHJldHVybnMgLUVFWElTVC4KPiBUaGlzIGlz
IG5vdCBhbiBlcnJvciAtLSB0aGUgcGFnZSBpcyBjb3JyZWN0bHkgbWFwcGVkIGFuZCB0aGUgZmF1
bHRpbmcKPiB2Q1BVIGNhbiBzaW1wbHkgcmV0cnkgdGhlIGd1ZXN0IGluc3RydWN0aW9uIC0tIGJ1
dCBLVk0gd2FzIHRyZWF0aW5nIGl0Cj4gYXMgb25lOiBwcmludGluZyAiRmFpbGVkIHRvIG1hcCBp
biBHLXN0YWdlIiB0byBkbWVzZyBhbmQgcHJvcGFnYXRpbmcKPiAtRUVYSVNUIGFsbCB0aGUgd2F5
IHRvIHVzZXJzcGFjZS4KClRoZSBrdm1fcmlzY3ZfZ3N0YWdlX21hcF9wYWdlKCkgcmV0dXJuIC1F
RVhJU1Qgb25seSB3aGVuIGEgbGVhZi1QVEUKb2YgaGlnaGVyLW9yZGVyIGFscmVhZHkgZXhpc3Rz
LiBJdCBkb2VzIG5vdCByZXR1cm4gZXJyb3Igd2hlbiBsZWFmLVBURSBhdApzYW1lIGxldmVsIGFs
cmVhZHkgZXhpc3RzIHNvIHRoaXMgaXMgYW4gaW52YWxpZCBmaXguCgpSZWdhcmRzLApBbnVwCgo+
Cj4gQWxpZ24gUklTQy1WIHdpdGggeDg2IGFuZCBhcm02NCwgd2hpY2ggYWxyZWFkeSBzd2FsbG93
IC1FRVhJU1QgaW4KPiB0aGVpciByZXNwZWN0aXZlIGZhdWx0IGhhbmRsZXJzLiAgVGhpcyBhbHNv
IGxldHMga3ZtX3JlbGVhc2VfZmF1bHRpbl9wYWdlKCkKPiBkcm9wIGl0cyAicmV0ICYmIHJldCAh
PSAtRUVYSVNUIiBzcGVjaWFsIGNhc2U6IHdpdGggcmV0IG5vcm1hbGl6ZWQgdG8gMAo+IHRoZSBy
ZWd1bGFyIHJlbGVhc2UgcGF0aCBpcyBjb3JyZWN0Lgo+Cj4gRml4ZXM6IDlkMDVjMWZlZTgzNyAo
IlJJU0MtVjogS1ZNOiBJbXBsZW1lbnQgc3RhZ2UyIHBhZ2UgdGFibGUgcHJvZ3JhbW1pbmciKQo+
IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnCj4gQXNzaXN0ZWQtYnk6IFl1YW5TaGVuZzogZGVl
cHNlZWstdjQtcHJvCj4gQ28tZGV2ZWxvcGVkLWJ5OiBRdWFuIFpob3UgPHpob3VxdWFuQGlzY2Fz
LmFjLmNuPgo+IFNpZ25lZC1vZmYtYnk6IFF1YW4gWmhvdSA8emhvdXF1YW5AaXNjYXMuYWMuY24+
Cj4gU2lnbmVkLW9mZi1ieTogQmluZ3l1IFhpYW4gPHNoYW5iZWV5b29AZ21haWwuY29tPgo+IC0t
LQo+ICBhcmNoL3Jpc2N2L2t2bS9tbXUuYyB8IDYgKysrKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA0
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNj
di9rdm0vbW11LmMgYi9hcmNoL3Jpc2N2L2t2bS9tbXUuYwo+IGluZGV4IDhhMGFhNWUwZTIxNi4u
OTQzZDhkYzcyMTA1IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL21tdS5jCj4gKysrIGIv
YXJjaC9yaXNjdi9rdm0vbW11LmMKPiBAQCAtNjUyLDExICs2NTIsMTMgQEAgaW50IGt2bV9yaXNj
dl9tbXVfbWFwKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgc3RydWN0IGt2bV9tZW1vcnlfc2xvdCAq
bWVtc2xvdCwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICB2bWFfcGFnZXNpemUsIHRydWUsIHRydWUsIG91dF9tYXApOwo+ICAgICAgICAgfQo+Cj4gLSAg
ICAgICBpZiAocmV0KQo+ICsgICAgICAgaWYgKHJldCA9PSAtRUVYSVNUKQo+ICsgICAgICAgICAg
ICAgICByZXQgPSAwOwo+ICsgICAgICAgZWxzZSBpZiAocmV0KQo+ICAgICAgICAgICAgICAgICBr
dm1fZXJyKCJGYWlsZWQgdG8gbWFwIGluIEctc3RhZ2VcbiIpOwo+Cj4gIG91dF91bmxvY2s6Cj4g
LSAgICAgICBrdm1fcmVsZWFzZV9mYXVsdGluX3BhZ2Uoa3ZtLCBwYWdlLCByZXQgJiYgcmV0ICE9
IC1FRVhJU1QsIHdyaXRhYmxlKTsKPiArICAgICAgIGt2bV9yZWxlYXNlX2ZhdWx0aW5fcGFnZShr
dm0sIHBhZ2UsIHJldCwgd3JpdGFibGUpOwo+ICAgICAgICAgd3JpdGVfdW5sb2NrKCZrdm0tPm1t
dV9sb2NrKTsKPiAgICAgICAgIHJldHVybiByZXQ7Cj4gIH0KPiAtLQo+IDIuNTQuMAo+CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
