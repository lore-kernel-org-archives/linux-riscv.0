Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2223FC3064D
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Jul 2024 12:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d5TMsMfXfpJaRX0J2FqGc//psiYHr6VNVJeN6nakmPE=; b=v4OBAUfQx4JEnv
	dFhnf5nmZ8d8sW+3RGx2BMxxIL7e4LgKxMrfTw8T3Ku+C1P0lfLUlATUNxHRniCmnru80AR+O2zM7
	9u/5TDkyCp8gupZ86M3AwtpWTk79LLp0MuXCx0qqkPxLrHy5cZeakD6BlAwftK3FxqA4gupRiiM69
	iB2GSWLfLML6zuncw2ECqSOCcMQLrzo09OG9qUE6HCRFkwHjeqtJtjXiKsh+8TPbJbGaA4BRWkXU8
	KsJbMeE9gKe/fRxqedMB8swVhKzdYsvH50IK80SN8Tjp8byQI162lVrbsNyutwJFA96tzaVyrjXzX
	ThfUu0+Mur+re1jfl9dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOcgT-00000006hHl-1IJI;
	Tue, 02 Jul 2024 12:32:33 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOcgN-00000006hFZ-0rdm
	for linux-riscv@lists.infradead.org;
	Tue, 02 Jul 2024 12:32:32 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-52cecba8d11so4994448e87.1
        for <linux-riscv@lists.infradead.org>; Tue, 02 Jul 2024 05:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1719923545; x=1720528345; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A/EMsHPmSnth6woXBxvP2VppNfrx4K00pLmSD+g9HAg=;
        b=P6gXy24mRNYkQn9oxbjEQfZHOuLwxGnEIMa06UtxRICndDGZ93xW4oPnsE2wdADUcP
         WYqXbdNCl0lb2EVWt0vqzGHUqP8bj04EfxYdSwe69eYrmJV0E3zfDdESZ4oi7Yk1DPtP
         K24uJIfOLc0hrS6jwvwpeqQ5jk3V1jtlmG21y0rqGPDGEhvOqr8IVbF86xIAGKaTRIjC
         KNRVPGhhQeXJjEpGlw2KeVQv4ciU4XZu20tQMxw/2JpNIiYJ6wW5H4HNG8hyJDIUzzo6
         4fl4lLG1cBKsDtwhzUqkGF5Gru3vLK8piYXeAW6zIUAVROL8MEqcDynceSnS8t46nmRQ
         aWVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719923545; x=1720528345;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A/EMsHPmSnth6woXBxvP2VppNfrx4K00pLmSD+g9HAg=;
        b=w/umLVBKQ3ohgCaKhz1Mkl56sY9EwE7hy2yDaGOd3QlLY3nnLcg7zwPb5qnCX8CwK1
         Tohn2AvR2ZKxulD9hftkw6Rs2MGaDnz4WRFy/InbIYJwQ/TcUipuDHTfLVybLyPL5B38
         CIrODx8RnD3BffDYlz4Ol37Y3V9YY5OanV7jRfelbpaxebaQyVVrCK4DFEK6vNbXuzfI
         O2Wkw9qXwPLJdonXm+4K++kkkAkaM13/VEfDn8R/XZo2BI7/xWJkMq9BZsIwBdUL8nJJ
         A48RzOQXE8vYMS/7lNxR5VSJOF2fScF/Qb6ajacx9TkHgTu3Xum7kRTQRWfoItAQsVuP
         WY8A==
X-Gm-Message-State: AOJu0YytEcLQKiYvrqUeedjTlhHpcmiJsDj/g6OAnQEpYLKGvmnKC8JD
	fmCGR2FH1ilIDHBLg4GuJjfWFB2+j85L6P0tMrlaDZqHqBib5vzY94DDk7E/V0OYKzUG8OkbOVF
	TrDFmtGgX9HYl104P3xUQetkJNsNL01zYqsOzIQ==
X-Google-Smtp-Source: AGHT+IH/wq6oLQq9gHpx4/LxIpvCVyvhR97jieeJFeavDaFmUvfj5G+7Q1SeDu8eeD2sFxyTgA6yN6ypQP7I6t+1h0A=
X-Received: by 2002:a05:6512:33cd:b0:52c:ddce:4fda with SMTP id
 2adb3069b0e04-52e82646d35mr6262218e87.2.1719923544623; Tue, 02 Jul 2024
 05:32:24 -0700 (PDT)
MIME-Version: 1.0
References: <20240702102637.9074-1-mchitale@ventanamicro.com>
In-Reply-To: <20240702102637.9074-1-mchitale@ventanamicro.com>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Tue, 2 Jul 2024 14:32:09 +0200
Message-ID: <CAHVXubg1h3EUvVUaQduUqJ6v1zfM1Z_hPAEviutkt_Ys1A4TXw@mail.gmail.com>
Subject: Re: [PATCH v8] riscv: mm: Add support for Svinval extension
To: Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Samuel Holland <samuel.holland@sifive.com>, 
	Andrew Jones <ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240702_053227_494474_24185EAA 
X-CRM114-Status: GOOD (  27.06  )
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

SGkgTWF5dXJlc2gsCgpPbiBUdWUsIEp1bCAyLCAyMDI0IGF0IDEyOjI24oCvUE0gTWF5dXJlc2gg
Q2hpdGFsZQo8bWNoaXRhbGVAdmVudGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4KPiBUaGUgU3ZpbnZh
bCBleHRlbnNpb24gc3BsaXRzIFNGRU5DRS5WTUEgaW5zdHJ1Y3Rpb24gaW50byBmaW5lci1ncmFp
bmVkCj4gaW52YWxpZGF0aW9uIGFuZCBvcmRlcmluZyBvcGVyYXRpb25zIGFuZCBpcyBtYW5kYXRv
cnkgZm9yIFJWQTIzUzY0IHByb2ZpbGUuCj4gV2hlbiBTdmludmFsIGlzIGVuYWJsZWQgdGhlIGxv
Y2FsX2ZsdXNoX3RsYl9yYW5nZV90aHJlc2hvbGRfYXNpZCBmdW5jdGlvbgo+IHNob3VsZCB1c2Ug
dGhlIGZvbGxvd2luZyBzZXF1ZW5jZSB0byBvcHRpbWl6ZSB0aGUgdGxiIGZsdXNoZXMgaW5zdGVh
ZCBvZgo+IGEgc2ltcGxlIHNmZW5jZS52bWE6Cj4KPiBzZmVuY2Uudy5pbnZhbAo+IHN2aW52YWwu
dm1hCj4gICAuCj4gICAuCj4gc3ZpbnZhbC52bWEKPiBzZmVuY2UuaW52YWwuaXIKPgo+IFRoZSBt
YXhpbXVtIG51bWJlciBvZiBjb25zZWN1dGl2ZSBzdmludmFsLnZtYSBpbnN0cnVjdGlvbnMgdGhh
dAo+IGNhbiBiZSBleGVjdXRlZCBpbiBsb2NhbF9mbHVzaF90bGJfcmFuZ2VfdGhyZXNob2xkX2Fz
aWQgZnVuY3Rpb24KPiBpcyBsaW1pdGVkIHRvIDY0LiBUaGlzIGlzIHJlcXVpcmVkIHRvIGF2b2lk
IHNvZnQgbG9ja3VwcyBhbmQgdGhlCj4gYXBwcm9hY2ggaXMgc2ltaWxhciB0byB0aGF0IHVzZWQg
aW4gYXJtNjQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBNYXl1cmVzaCBDaGl0YWxlIDxtY2hpdGFsZUB2
ZW50YW5hbWljcm8uY29tPgo+IFJldmlld2VkLWJ5OiBBbmRyZXcgSm9uZXMgPGFqb25lc0B2ZW50
YW5hbWljcm8uY29tPgo+IC0tLQo+IENoYW5nZXMgaW4gdjg6Cj4gLSBGaXggbGluZSB3cmFwCj4g
LSBBZGQgUkIgdGFnCj4KPiBDaGFuZ2VzIGluIHY3Ogo+IC0gVXNlIGV4aXN0aW5nIHN2aW52YWwg
bWFjcm9zIGluIHRoZSBpbnNuLWRlZi5oCj4gLSBSZW5hbWUgbG9jYWxfc2ludmFsX3ZtYV9hc2lk
IHRvIGxvY2FsX3NpbnZhbF92bWEKPgo+IENoYW5nZXMgaW4gdjY6Cj4gLSBSZWJhc2Ugb24gbGF0
ZXN0IHRvcnZhbGRzL21hc3Rlcgo+Cj4gQ2hhbmdlcyBpbiB2NToKPiAtIFJlZHVjZSB0bGIgZmx1
c2ggdGhyZXNob2xkIHRvIDY0Cj4gLSBJbXByb3ZlIGltcGxlbWVudGF0aW9uIG9mIGxvY2FsX2Zs
dXNoX3RsYiogZnVuY3Rpb25zCj4KPiBDaGFuZ2VzIGluIHY0Ogo+IC0gUmViYXNlIGFuZCByZWZh
Y3RvciBhcyBwZXIgbGF0ZXN0IGNoYW5nZXMgb24gdG9ydmFsZHMvbWFzdGVyCj4gLSBEcm9wIHBh
dGNoIDEgaW4gdGhlIHNlcmllcwo+Cj4gQ2hhbmdlcyBpbiB2MzoKPiAtIEZpeCBpbmNvcnJlY3Qg
dm1hIHVzZWQgZm9yIHNpbnZhbCBpbnN0cnVjdGlvbnMKPiAtIFVzZSB1bmlmaWVkIHN0YXRpYyBr
ZXkgbWVjaGFuaXNtIGZvciBzdmludmFsCj4gLSBSZWJhc2VkIG9uIHRvcnZhbGRzL21hc3Rlcgo+
Cj4gQ2hhbmdlcyBpbiB2MjoKPiAtIFJlYmFzZWQgb24gNS4xOC1yYzMKPiAtIHVwZGF0ZSByaXNj
dl9maWxsX2h3Y2FwIHRvIHByb2JlIFN2aW52YWwgZXh0ZW5zaW9uCj4KPiAgYXJjaC9yaXNjdi9t
bS90bGJmbHVzaC5jIHwgMzIgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgMSBm
aWxlIGNoYW5nZWQsIDMyIGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2
L21tL3RsYmZsdXNoLmMgYi9hcmNoL3Jpc2N2L21tL3RsYmZsdXNoLmMKPiBpbmRleCA5YjZlODZj
ZTM4NjcuLjc4MjE0N2E2M2YzYiAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L21tL3RsYmZsdXNo
LmMKPiArKysgYi9hcmNoL3Jpc2N2L21tL3RsYmZsdXNoLmMKPiBAQCAtNiw2ICs2LDI3IEBACj4g
ICNpbmNsdWRlIDxsaW51eC9odWdldGxiLmg+Cj4gICNpbmNsdWRlIDxhc20vc2JpLmg+Cj4gICNp
bmNsdWRlIDxhc20vbW11X2NvbnRleHQuaD4KPiArI2luY2x1ZGUgPGFzbS9jcHVmZWF0dXJlLmg+
Cj4gKwo+ICsjZGVmaW5lIGhhc19zdmludmFsKCkgIHJpc2N2X2hhc19leHRlbnNpb25fdW5saWtl
bHkoUklTQ1ZfSVNBX0VYVF9TVklOVkFMKQo+ICsKPiArc3RhdGljIGlubGluZSB2b2lkIGxvY2Fs
X3NmZW5jZV9pbnZhbF9pcih2b2lkKQo+ICt7Cj4gKyAgICAgICBhc20gdm9sYXRpbGUoU0ZFTkNF
X0lOVkFMX0lSKCkgOjo6ICJtZW1vcnkiKTsKPiArfQo+ICsKPiArc3RhdGljIGlubGluZSB2b2lk
IGxvY2FsX3NmZW5jZV93X2ludmFsKHZvaWQpCj4gK3sKPiArICAgICAgIGFzbSB2b2xhdGlsZShT
RkVOQ0VfV19JTlZBTCgpIDo6OiAibWVtb3J5Iik7Cj4gK30KPiArCj4gK3N0YXRpYyBpbmxpbmUg
dm9pZCBsb2NhbF9zaW52YWxfdm1hKHVuc2lnbmVkIGxvbmcgdm1hLCB1bnNpZ25lZCBsb25nIGFz
aWQpCj4gK3sKPiArICAgICAgIGlmIChhc2lkICE9IEZMVVNIX1RMQl9OT19BU0lEKQo+ICsgICAg
ICAgICAgICAgICBhc20gdm9sYXRpbGUoU0lOVkFMX1ZNQSglMCwgJTEpIDogOiAiciIgKHZtYSks
ICJyIiAoYXNpZCkgOiAibWVtb3J5Iik7Cj4gKyAgICAgICBlbHNlCj4gKyAgICAgICAgICAgICAg
IGFzbSB2b2xhdGlsZShTSU5WQUxfVk1BKCUwLCB6ZXJvKSA6IDogInIiICh2bWEpIDogIm1lbW9y
eSIpOwo+ICt9Cj4KPiAgLyoKPiAgICogRmx1c2ggZW50aXJlIFRMQiBpZiBudW1iZXIgb2YgZW50
cmllcyB0byBiZSBmbHVzaGVkIGlzIGdyZWF0ZXIKPiBAQCAtMjYsNiArNDcsMTYgQEAgc3RhdGlj
IHZvaWQgbG9jYWxfZmx1c2hfdGxiX3JhbmdlX3RocmVzaG9sZF9hc2lkKHVuc2lnbmVkIGxvbmcg
c3RhcnQsCj4gICAgICAgICAgICAgICAgIHJldHVybjsKPiAgICAgICAgIH0KPgo+ICsgICAgICAg
aWYgKGhhc19zdmludmFsKCkpIHsKPiArICAgICAgICAgICAgICAgbG9jYWxfc2ZlbmNlX3dfaW52
YWwoKTsKPiArICAgICAgICAgICAgICAgZm9yIChpID0gMDsgaSA8IG5yX3B0ZXNfaW5fcmFuZ2U7
ICsraSkgewo+ICsgICAgICAgICAgICAgICAgICAgICAgIGxvY2FsX3NpbnZhbF92bWEoc3RhcnQs
IGFzaWQpOwo+ICsgICAgICAgICAgICAgICAgICAgICAgIHN0YXJ0ICs9IHN0cmlkZTsKPiArICAg
ICAgICAgICAgICAgfQo+ICsgICAgICAgICAgICAgICBsb2NhbF9zZmVuY2VfaW52YWxfaXIoKTsK
PiArICAgICAgICAgICAgICAgcmV0dXJuOwo+ICsgICAgICAgfQo+ICsKPiAgICAgICAgIGZvciAo
aSA9IDA7IGkgPCBucl9wdGVzX2luX3JhbmdlOyArK2kpIHsKPiAgICAgICAgICAgICAgICAgbG9j
YWxfZmx1c2hfdGxiX3BhZ2VfYXNpZChzdGFydCwgYXNpZCk7Cj4gICAgICAgICAgICAgICAgIHN0
YXJ0ICs9IHN0cmlkZTsKPiAtLQo+IDIuMzQuMQo+CgpHcmVhdCwgdGhhbmtzIGFnYWluIGZvciBy
ZXdvcmtpbmcgdGhpcyBwYXRjaHNldCEKClJldmlld2VkLWJ5OiBBbGV4YW5kcmUgR2hpdGkgPGFs
ZXhnaGl0aUByaXZvc2luYy5jb20+CgpUaGFua3MsCgpBbGV4CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
