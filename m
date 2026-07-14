Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 243F1C43458
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jul 2026 13:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R5Mf5VznmyQA4cYiNq84k2ayYlyof2qToeqvLqwRwO8=; b=omD1r1qWGafB0Z
	IG2ohqMB7Mj98g4pP+zXcAUNFr1T4OUkPJ/BnwCc7hJCtOsXWGTRGTDxMx0H2fcJup+TrKJx90Po3
	BOTXhw8nFS5wFQQi+dpSqmaAHk8izx4xBBbnGo45SWPOCyx0jppgQoxBOcw2zE7IM8eLDb8QNCkLm
	F2qesdnrm9NcGWGz1vMALBoi+RWd8G8dBnv5FSGAFGHwdeBLL3Eu7fUZA2qS57KMBWMZhLDqtgWJw
	VMOty9wB/7lYyFME0oWKxdTWqz3XIJL7E9nZpdlLdLBuyGsLmeiJfwVgB7h9V+hsoTjVas1fjqXn8
	9eUebQtq1mmeiy5uQUIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcyx-0000000C89n-2lQf;
	Tue, 14 Jul 2026 13:15:31 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcyu-0000000C89H-3ho8
	for linux-riscv@lists.infradead.org;
	Tue, 14 Jul 2026 13:15:30 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4938d5f86f3so6703285e9.1
        for <linux-riscv@lists.infradead.org>; Tue, 14 Jul 2026 06:15:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784034927; cv=none;
        d=google.com; s=arc-20260327;
        b=itsSl/tWi2kywORLW5jDsKtSW7SjjIeT3KWgSA0ENvXywCVtXJaJ3g83fzg+PjoVKt
         TezrrRl+Z8hYoj57e37VHwB4YJDPVxmvpidQ1TYD7ckSUJDPEi5trETF2kbriwcN+qRk
         N/i+mEdlu2lRnQYeKKxh6EHa5feHjfMjh+Gac1Q9hIl9mj71XoZJftYcUTMMElYffjW5
         MsQm9KD13ZWaCMSJ26hWD1tFoxREzJnMWDW/Jd2qfZJqP8U3hcwvPKu26jPFzHVXT9TI
         jdzt3u9pVFYix+8wBm5p013b0vFTuDmQxL4yPQcjNYJfhNe39rQhmNfMLlNJaE6asgTz
         ZbZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SVFYbu10VGEQlJON1n2vyFqDrDBV30YmpJjoFKPaA+0=;
        fh=GAlCJHpxQXL0MLZCp203qwW31o4cDq6/7y6cvH+MQZ4=;
        b=sBkb55U96bTraDLzbp8kpp04zCuVIwGEu81lyd6o139dBMFqmzM3bN2JPz1CZaPI18
         yuJg6vSBuiO6MzZ6C8NjjyG1vL1zssCvH74aqX2aLJwcDEWbDCr/MypZmb2Dcx+GeKLw
         8ZvIeRMcGICXZMtgTvPqXH3EF9wVdC9f98Mtj91WZiM5eXGGbNG+gquSKCF0sD4naxfU
         dhhZRNdjcDWd8jPI6abh128abyh8ORFyFz+TpLv3p0kzpNRTxKhDNCz3azE7jQZYd0+m
         pZBn7x4TutagTV5cMCJzAGFCs7A8tdn4Xe8cOMfXhKrNLwZcL8eCYXj/0vCfpLIXfebU
         5IUg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1784034927; x=1784639727; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SVFYbu10VGEQlJON1n2vyFqDrDBV30YmpJjoFKPaA+0=;
        b=R0r0oY2i7n4C/UmVwb4Rs3V7aFaHLKhqzoYyME1nBn1vf6CsZBpwsEazHeBHGkYAwl
         +CKQ1FKjz5GQcUPjrJTXdR/Yv+WIm5QMt3Lh85IVaXsnY4ke/JSu2PDfYSekSn4ZsK1N
         Wy8OoyfD0Ih+8Gi6QtSuQuOiTqrBTOt2tKZw6fc5+04MjgX/SIOkzr5biD+a6mzmslYf
         1P4hF+CEethAWyoE9xs8IeXIwAt0UU8PzyMh7U41nh/6micezNT2RTtzCbeknv+4YXZv
         gFM+PRDQey61YVkap9OKmYeCKslo47J+yZJRz/dXI/K3VOgM0YX954fk26+NbUnLFWXs
         GDCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784034927; x=1784639727;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SVFYbu10VGEQlJON1n2vyFqDrDBV30YmpJjoFKPaA+0=;
        b=Ji7OLyDlh2RujsWidxZgr4qyQw7Yf7BvM0DLFW0PfSqCkZiLiaU+jRf4E3agx0oWJi
         HLVvzpk2lXbVsJDJz03O29Ey6fnJtz+XRqBA9tr2M9jQVMB2mb7ymLSJu6kkK/aebVp6
         JCwq9cOi0tXSL7rRmwd2BfJbWxxQI6CFm+iZUE7iUJTP1fnV+yCBQ27BcEqakm60htGk
         szfrtPhG+n0uulgqYYJULKEIVOZcsAOBGxyKaiBDegWpw8UoUCUhhXGGJKjvztlfSA/Y
         aYTixjwPYqheVyYLoXb+NPle1DgxRRcRkjGiwAw0bGapv0K6kKgRX0RYYMlWwFdtsFET
         TIjg==
X-Forwarded-Encrypted: i=1; AHgh+RpN6M2+0wJkiPpl9JSBF/5K2kkMnbz0k4eVhET0VqQD7CCN0xyrOgrm8NhM5iapSo+h2q7v8wBA7s92TA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzcJHvHpAkR1YEH1C6lnWn2ceZT2iiJZhrIcxUufMvnw31zrQ4/
	tLIgzAm92iquP9mSGVbhZJRpTF26jAjaBNMMMjyB+0osZAF9c39JpFOyPbAoxauBwnKp1MtHldR
	saAjZdv/A2OW+8ha6Q7p96pXGDK7M6Oo3bl47/BWlGevH2AWpf/bvr6s=
X-Gm-Gg: AfdE7cljrgTNV+9X5o2mYeYDKKren3WfYlNyU4FzMIycFv2JKmyQwyjCUQeSxKCq6wW
	gtNY+CBjUy/+x116cFXBwEGBQiOFWz8YkrUCBfXBf3tKPJtSJe9s2CZx6Xs+vtMJElrwfaoHbf+
	G0QROe3ggmrDN8bGM6T8Px6OuTq9mN+BtbWtlj28cmLxqQAeGbS7k2gc92CMAt3fZ+PnUvaFrLv
	esJDhhcGAbey9Kh7qBNIe2kku3CrgKC8GsiMZMo85zQ/rRXfLV+KESkIscBqksD0bBa4YaQIBOy
	3pN3eMPJ0SOfOE1DUFUo696zt6DuonxJ7O6ZldJ+O/N5/3enIkBAwq0V734CTg4MNCm7GWRu06B
	CdNDDp65tNt4EosTsTnMG8LCO83cgvHeokd0T
X-Received: by 2002:a05:600c:4e16:b0:492:714d:8c4 with SMTP id
 5b1f17b1804b1-49400818cd7mr93571815e9.11.1784034927043; Tue, 14 Jul 2026
 06:15:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260714122351.3274006-1-lihaofeng@kylinos.cn> <20260714122351.3274006-2-lihaofeng@kylinos.cn>
In-Reply-To: <20260714122351.3274006-2-lihaofeng@kylinos.cn>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 14 Jul 2026 18:45:14 +0530
X-Gm-Features: AUfX_mxEmlu3eMX2pyvsCA3t5NLYELhW2BqYRLaAb_ix8hnKbn3gTE6vk0m2QQQ
Message-ID: <CAAhSdy0CGFcan+rCACW_87boqX0JBZXsEPf8M18q4y6c9PNYLg@mail.gmail.com>
Subject: Re: [PATCH 01/16] irqchip/riscv-imsic: fix MMIO lookup OOB and NULL cleanup
To: Haofeng Li <lihaofeng@kylinos.cn>
Cc: tglx@kernel.org, linux-kernel@vger.kernel.org, 
	Haofeng Li <13266079573@163.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_061528_961697_A9F22AC7 
X-CRM114-Status: GOOD (  18.11  )
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

T24gVHVlLCBKdWwgMTQsIDIwMjYgYXQgNTo1NOKAr1BNIEhhb2ZlbmcgTGkgPGxpaGFvZmVuZ0Br
eWxpbm9zLmNuPiB3cm90ZToKPgo+IFRoZSBNU0kgcGFnZSBsb29rdXAgbG9vcCB1c2VzOgo+Cj4g
ICAgICAgICBmb3IgKGogPSAwOyBucl9tbWlvczsgaisrKQo+Cj4gV2hlbiBucl9tbWlvcyBpcyBu
b24temVybyB0aGUgY29uZGl0aW9uIGlzIGFsd2F5cyB0cnVlLCBzbyBqIGlzIG5ldmVyCj4gYm91
bmRlZC4gSWYgcmVsb2ZmIGRvZXMgbm90IGZhbGwgaW4gYW55IE1NSU8gcmVnaW9uIHRoZSBsb29w
IGluZGV4ZXMKPiBwYXN0IG1taW9zW10gYW5kIG1heSBoYW5nIG9yIGZhdWx0LgoKSXQgaXMgaW5k
ZWVkIGFuIHVnbHkgdHlwbyBpbiBmb3ItbG9vcC4gSSBndWVzcyBvbiBtb3N0IHBsYXRmb3Jtcwp3
aXRoIEFJQSB0aGUgYmVsb3cgImlmIChyZWxvZmYgPCByZXNvdXJjZV9zaXplKCZtbWlvc1tqXSkp
IHsiIHRha2VzCmNhcmUgb2YgbG9vcCB0ZXJtaW5hdGlvbiBidXQgd2UgY2FuJ3QgcmVseSBvbiBp
dC4KCj4KPiBBbHNvLCBtbWlvc192YSBzdGFydHMgYXMgTlVMTC4gSWYgaXRzIGFsbG9jYXRpb24g
ZmFpbHMsIHRoZSBvdXRfaW91bm1hcAo+IHBhdGggaW5kZXhlcyBtbWlvc192YVtpXSBhbmQgTlVM
TC1kZXJlZmVyZW5jZXMuCj4KPiBCb3VuZCB0aGUgbG9vcCB3aXRoIGogPCBucl9tbWlvcywgYW5k
IGd1YXJkIHRoZSBpb3VubWFwL2tmcmVlIGNsZWFudXAKPiB3aXRoIGlmIChtbWlvc192YSkuCj4K
PiBGaXhlczogMjFhOGY4YTBlYjM1ICgiaXJxY2hpcDogQWRkIFJJU0MtViBpbmNvbWluZyBNU0kg
Y29udHJvbGxlciBlYXJseSBkcml2ZXIiKQo+IFNpZ25lZC1vZmYtYnk6IEhhb2ZlbmcgTGkgPGxp
aGFvZmVuZ0BreWxpbm9zLmNuPgoKTEdUTS4KClJldmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVw
QGJyYWluZmF1bHQub3JnPgoKVGhhbmtzLApBbnVwCgo+IC0tLQo+ICBkcml2ZXJzL2lycWNoaXAv
aXJxLXJpc2N2LWltc2ljLXN0YXRlLmMgfCAxMiArKysrKysrLS0tLS0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDcgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWltc2ljLXN0YXRlLmMgYi9kcml2ZXJzL2lycWNoaXAvaXJx
LXJpc2N2LWltc2ljLXN0YXRlLmMKPiBpbmRleCBiOGQxYmJiZjQyZjcuLjE5Zjc0Y2Y3OTk4OCAx
MDA2NDQKPiAtLS0gYS9kcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWltc2ljLXN0YXRlLmMKPiAr
KysgYi9kcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWltc2ljLXN0YXRlLmMKPiBAQCAtODk2LDcg
Kzg5Niw3IEBAIGludCBfX2luaXQgaW1zaWNfc2V0dXBfc3RhdGUoc3RydWN0IGZ3bm9kZV9oYW5k
bGUgKmZ3bm9kZSwgdm9pZCAqb3BhcXVlKQo+ICAgICAgICAgICAgICAgICBpbmRleCA9IG5yX21t
aW9zOwo+ICAgICAgICAgICAgICAgICByZWxvZmYgPSBpICogQklUKGdsb2JhbC0+Z3Vlc3RfaW5k
ZXhfYml0cykgKgo+ICAgICAgICAgICAgICAgICAgICAgICAgICBJTVNJQ19NTUlPX1BBR0VfU1o7
Cj4gLSAgICAgICAgICAgICAgIGZvciAoaiA9IDA7IG5yX21taW9zOyBqKyspIHsKPiArICAgICAg
ICAgICAgICAgZm9yIChqID0gMDsgaiA8IG5yX21taW9zOyBqKyspIHsKPiAgICAgICAgICAgICAg
ICAgICAgICAgICBpZiAocmVsb2ZmIDwgcmVzb3VyY2Vfc2l6ZSgmbW1pb3Nbal0pKSB7Cj4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpbmRleCA9IGo7Cj4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBicmVhazsKPiBAQCAtOTUzLDExICs5NTMsMTMgQEAgaW50IF9faW5p
dCBpbXNpY19zZXR1cF9zdGF0ZShzdHJ1Y3QgZndub2RlX2hhbmRsZSAqZndub2RlLCB2b2lkICpv
cGFxdWUpCj4gIG91dF9sb2NhbF9jbGVhbnVwOgo+ICAgICAgICAgaW1zaWNfbG9jYWxfY2xlYW51
cCgpOwo+ICBvdXRfaW91bm1hcDoKPiAtICAgICAgIGZvciAoaSA9IDA7IGkgPCBucl9tbWlvczsg
aSsrKSB7Cj4gLSAgICAgICAgICAgICAgIGlmIChtbWlvc192YVtpXSkKPiAtICAgICAgICAgICAg
ICAgICAgICAgICBpb3VubWFwKG1taW9zX3ZhW2ldKTsKPiArICAgICAgIGlmIChtbWlvc192YSkg
ewo+ICsgICAgICAgICAgICAgICBmb3IgKGkgPSAwOyBpIDwgbnJfbW1pb3M7IGkrKykgewo+ICsg
ICAgICAgICAgICAgICAgICAgICAgIGlmIChtbWlvc192YVtpXSkKPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGlvdW5tYXAobW1pb3NfdmFbaV0pOwo+ICsgICAgICAgICAgICAgICB9
Cj4gKyAgICAgICAgICAgICAgIGtmcmVlKG1taW9zX3ZhKTsKPiAgICAgICAgIH0KPiAtICAgICAg
IGtmcmVlKG1taW9zX3ZhKTsKPiAgICAgICAgIGtmcmVlKG1taW9zKTsKPiAgb3V0X2ZyZWVfbG9j
YWw6Cj4gICAgICAgICBmcmVlX3BlcmNwdShpbXNpYy0+Z2xvYmFsLmxvY2FsKTsKPiAtLQo+IDIu
MjUuMQo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
