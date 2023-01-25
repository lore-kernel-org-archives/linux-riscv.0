Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D847C54E94
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Jan 2023 12:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=u6LnGCzliSgDXmUdksWxBgyPiGoEQV+j5CBOBpUxZQc=; b=3FR4VrTAb2PXbn
	ziGQNyHQmKi4W36VrU18WVg8QEyEJj48ymz9/QIEEnV7uUcVz5a43dvEQOvAsEUSgQ/v2gsF6Izs2
	BaYDtcIQsvTzRU96lm8M8dmDVVqVX3lnK1/AwuHREuRR0zxu7jKsGAHnTWGC2w+J8HK8M6lhDUK6c
	cwraORneE9giJUTMZAPpRx7BTal92T4d90eb5qR8JXsbvBhqwMNvsbFrvNKOB3/CekhqalQ5CzXgN
	pJZJhndOMWBIb/oB1TgSlDC2B4W7hAi6YbLp6ijxA2obLzZIdz9tlk/yhbYhWGIggwFQfMQRUUp2/
	rAoGiJfYXdIMwdOjYANw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKevN-007IDl-CH; Wed, 25 Jan 2023 12:30:45 +0000
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKevL-007ID2-2C
	for linux-riscv@lists.infradead.org; Wed, 25 Jan 2023 12:30:44 +0000
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-506609635cbso46397217b3.4
        for <linux-riscv@lists.infradead.org>; Wed, 25 Jan 2023 04:30:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gTVJ5IeBy0z9R5c5aNjfyFKovOA3r97gzXqNSx0yexE=;
        b=AsBm6dEOEuSBgIj7OsJAOnftvKkT6rBN6P2wzlFIKn3kR8YGtxFPJooMQn/sYVLvky
         /b6Mdw4nrVBYlg69L+8bWvqct9IlyOhzunrixHPlUe0D3rOnVXoYtZM467trNOF6yMsi
         sLhMRcodynBeNI6DYVMAzDREo9c+1o2DEgiWlm6ozysyiUPMgJcQvkAlVaaEajtVRNJP
         oj1odxsyYvR8YpHvqjVcRQf7Xwyx55GeAv+ar4IB0Ni0eZPxlmKq6yrPje/Ruwi3fxWM
         59h7/YZdMZ/Ldy6HGbmcKXQTgfKJa4W4GrnBjr7DVX2ajeCoip5khf6Qg/+E4anSMz9Y
         t+rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gTVJ5IeBy0z9R5c5aNjfyFKovOA3r97gzXqNSx0yexE=;
        b=reRYzOBFwx7DelgTMiBUPfbZ5qjapQhw3XWMXqwuIa3G2MSKvKKCviHQgwcSrVeL/q
         F03V297ojuT+S2JLl+MAHToCg83JQqeZFVg7OHTlajZlgClANKfZQPSVBZ4v5cC/yfT+
         TUMC3mtW8+oUhJY9DPjJXJ9erAILC1MhrryAUfFcY4+GJHowzilsHNM+4fHXibf++gcx
         jVx5tyiTbNBgmSA6+7Ch2A+OgAdrkl3UtdJlbZgM1QOyWbKpLLx+/7mYDfMPxcABm3/2
         r4PRFsg3n+PWWXYrA/GGxCyuCYXAVdP9At+8oBsMOTZTPOzKjhZ88n1SezZ2uB0CtGTZ
         kYnA==
X-Gm-Message-State: AFqh2kqIEHiJbPc9K1AfzdCnux98NGLYK6nrzZ7dRidHVWu9NzzAlr/M
	rDbCaBTC0dYzAkjthYL9gZwfADM7hFgQJaFnTT8=
X-Google-Smtp-Source: AMrXdXut2HOW6nQLQPB79z8MmIxPOz8DnDv0LgpXrdDm5LiUzPvokqudwvptpL2xy0l3DxSJcVaiA90Cebe+1eBbFzs=
X-Received: by 2002:a0d:c9c4:0:b0:461:bf16:bb9f with SMTP id
 l187-20020a0dc9c4000000b00461bf16bb9fmr3701514ywd.105.1674649839044; Wed, 25
 Jan 2023 04:30:39 -0800 (PST)
MIME-Version: 1.0
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 25 Jan 2023 12:30:13 +0000
Message-ID: <CA+V-a8tR1KiLSs=Psa=w7kf0zT=yU5_Ekr6-3V1MR==Wtzmksg@mail.gmail.com>
Subject: [QUERY]: Block region to mmap
To: Linux-MM <linux-mm@kvack.org>, linux-riscv <linux-riscv@lists.infradead.org>, 
	device-tree <devicetree-discuss@lists.ozlabs.org>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jessica Clarke <jrtc27@jrtc27.com>, 
	Geert Uytterhoeven <geert.uytterhoeven@gmail.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Chris Paterson <Chris.Paterson2@renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_043043_139524_2435A0C9 
X-CRM114-Status: GOOD (  14.28  )
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

SGkgQWxsLAoKUmVuZXNhcyBSWi9GaXZlIFJJU0MtViBTb0MgaGFzIEluc3RydWN0aW9uIGxvY2Fs
IG1lbW9yeSBhbmQgRGF0YSBsb2NhbAptZW1vcnkgKElMTSAmIERMTSkgbWFwcGVkIGJldHdlZW4g
cmVnaW9uIDB4MzAwMDAgLSAweDRGRkZGLiBXaGVuIGEKdmlydHVhbCBhZGRyZXNzIGZhbGxzIHdp
dGhpbiB0aGlzIHJhbmdlLCB0aGUgTU1VIGRvZXNuJ3QgdHJpZ2dlciBhCnBhZ2UgZmF1bHQ7IGl0
IGFzc3VtZXMgdGhlIHZpcnR1YWwgYWRkcmVzcyBpcyBhIHBoeXNpY2FsIGFkZHJlc3Mgd2hpY2gK
Y2FuIGNhdXNlIHVuZGVzaXJlZCBiZWhhdmlvdXJzLgoKVG8gYXZvaWQgdGhpcyB0aGUgSUxNL0RM
TSBtZW1vcnkgcmVnaW9ucyBhcmUgbm93IGFkZGVkIHRvIHRoZSByb290CmRvbWFpbiByZWdpb24g
b2YgdGhlIFBNUFUgd2l0aCBwZXJtaXNzaW9ucyBzZXQgdG8gMHgwIGZvciBTL1UgbW9kZXMgc28K
dGhhdCBhbnkgYWNjZXNzIHRvIHRoZXNlIHJlZ2lvbnMgZ2V0cyBibG9ja2VkIGFuZCBmb3IgTS1t
b2RlIHdlIGdyYW50CmZ1bGwgYWNjZXNzIChSL1cvWCkuIFRoaXMgcHJldmVudHMgYW55IHVzZXJz
IGZyb20gYWNjZXNzaW5nIHRoZXNlCnJlZ2lvbnMgYnkgdHJpZ2dlcmluZyBhbiB1bmhhbmRsZWQg
c2lnbmFsIDExIGluIFMvVSBtb2Rlcy4KClRoaXMgd29ya3MgYXMgZXhwZWN0ZWQgYnV0IGZvciBh
cHBsaWNhdGlvbnMgc2F5IGZvciBleGFtcGxlIHdoZW4gZG9pbmcKbW1hcCB0byB0aGlzIHJlZ2lv
biB3b3VsZCBzdGlsbCBzdWNjZWVkIGFuZCBsYXRlciBkb3duIHRoZSBwYXRoIHdoZW4KZG9pbmcg
YSByZWFkL3dyaXRlIHRvIHRoaXMgbG9jYXRpb24gd291bGQgY2F1c2UgdW5oYW5kbGVkIHNpZ25h
bCAxMS4KVG8gaGFuZGxlIHRoaXMgY2FzZSBncmFjZWZ1bGx5IHdlIG1pZ2h0IHdhbnQgbW1hcCgp
IGl0c2VsZiB0byBmYWlsIGlmCnRoZSBhZGRyL29mZnNldCBmYWxscyBpbiB0aGlzIGxvY2FsIG1l
bW9yeSByZWdpb24uCgpUcmFjaW5nIHRocm91Z2ggdGhlIG1tYXAgY2FsbCB3ZSBoYXZlIGFyY2hf
bW1hcF9jaGVjaygpIGlmIGltcGxlbWVudGVkCmJ5IGFyY2hpdGVjdHVyZXMgdGhpcyBjYWxsYmFj
ayBnZXRzIGNhbGxlZCBhbmQgaXQgY2FuIGJlIHVzZWQgYXMgYQp2YWxpZGF0b3IgdG8gbWFrZSBz
dXJlIG1tYXAoKSB0byB0aGUgbG9jYWwgbWVtb3J5IHJlZ2lvbiBmYWlscy4gKE5vdGUKbWF5YmUg
dGhpcyBjYWxsYmFjayBjYW4gYmUgaW1wbGVtZW50ZWQgdXNpbmcgQUxURVJOQVRJVlgoKSBtYWNy
byBzbwp0aGF0IG90aGVyIFJJU0MtViBTb0NzIGRvIG5vcCgpIHRvIHRoaXMgY2FsbGJhY2spLiBU
aGlzIGFwcHJvYWNoIHNlZW1zCnJlYXNvbmFibGUgYnV0IGlzbid0IGEgZ2VuZXJpYyBhcHByb2Fj
aC4gRm9yIG90aGVyIHBsYXRmb3JtcyB3aXRoCnNpbWlsYXIgaXNzdWVzIHdpbGwgaGF2ZSB0byBn
byB0aHJvdWdoIHNpbWlsYXIgaW1wbGVtZW50YXRpb24uIEluc3RlYWQKaWYgd2UgZGVmaW5lIHRo
ZSBtZW1vcnkgcmVnaW9ucyBpbiB0aGUgZGV2aWNlIHRyZWUgdGhhdCBhcmVuJ3QgdG8gYmUKYWxs
b3dlZCB0byBiZSBtbWFwZWQgd2l0aCB0aGlzIGFwcHJvYWNoIHRoZSBpbXBsZW1lbnRhdGlvbiBj
YW4gYmUKZ2VuZXJpYyBhbmQgY2FuIGJlIHVzZWQgb24gb3RoZXIgYXJjaHMvcGxhdGZvcm1zLgoK
TG9va2luZyBhdCB0aGUga2VybmVsIGNvZGUgU1BBUkMgYXJjaGl0ZWN0dXJlIChVbHRyYVNQQVJD
IFQxKSBhbHNvIGhhcwphIGhvbGUgaW4gdGhlIHZpcnR1YWwgbWVtb3J5IGFkZHJlc3Mgc3BhY2Ug
KHJlbGV2YW50IGNvbW1pdC1pZCB0byBmaXgKdGhpcyBpc3N1ZSA4YmNkMTc0MTE2NDNiZWI5YTYw
MWUwMzJkMGNmMTAxNjkwOWE4MWQzKS4KQXMgdGhpcyBWQSBob2xlIOKAnHN1cHBvcnTigJ0gaGFz
IGJlZW4gYWRkZWQgYSBsb25nIHRpbWUgYWdvIG5vdywgYW5kCm1heWJlIHNpbXBseSByZXBsaWNh
dGluZyB0aGVpciBhcHByb2FjaCBpcyBub3QgYWNjZXB0YWJsZSBhbnltb3JlCmhlbmNlIHRoZSBw
cm9wb3NlZCBhcHByb2FjaC4KCklzIHRoZXJlIGFueSBiZXR0ZXIgYXBwcm9hY2ggd2hpY2ggSSBh
bSBtaXNzaW5nLCBhbnkgcG9pbnRlcnMgY29tbWVudHMgd2VsY29tZS4KCkNoZWVycywKUHJhYmhh
a2FyCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
