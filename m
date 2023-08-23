Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7E51EE49AD
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Aug 2023 03:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eWHlNcmLIgS3VkdaWepYWw+JhSdJUXipt8AOgahHjLc=; b=owbhPcu5n6Te4v
	d8rpjFXQpkSgAzpjgmk+FyUa4mcBuqN9k0Cl1jTrb7Em6MQihLN0ykdO7mO/Ih0B3B4czpCTV0nuC
	efODep84exiyc9RUMUpX/ihCslCI0zkTtZMfDIcOQyXq5StSzIAAYxLVlL8f0nIXzxMLk4w48/s1A
	Vsre2rx20KSZi7nkdMztNJBdHRHltZLe5sWdLrJXtxA96f2NStmN3rMhFkO1LyAjACgB2kf5pKxgJ
	Zz64mv5C14hD03PHwmwiuTbvd2iAljBizao9yAIjNY+/tBKQLwZKfYu2WoV6kv/WJ92498+IQPGrF
	W4oInfVYMvudbRnoE00w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYeEI-00H7or-1Y;
	Wed, 23 Aug 2023 03:08:22 +0000
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYeEF-00H7oY-2v
	for linux-riscv@lists.infradead.org;
	Wed, 23 Aug 2023 03:08:21 +0000
Received: by mail-qv1-xf2b.google.com with SMTP id 6a1803df08f44-649a11843b3so31402766d6.0
        for <linux-riscv@lists.infradead.org>; Tue, 22 Aug 2023 20:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1692760098; x=1693364898;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CkQUyiTsYG+ARm3flGU77GSgWFGzu67vEgomaDrOEfI=;
        b=mFxqJgPSj+kuvWL3L9SwEJjXKm9xeURzPWH0aCan02nNg58Mm9rXpTv9WbSOI/4xhq
         TAi1TAdfih8O9+HmxdfmNggKnG3nVlvku6Ax4TBLu9r+9EEaKjGYfdYSlzTxejvB0MYP
         CoQE+85Cj2BkJGaLEzaOv51haaNGat0gULaL/SfUm7mccY0YxTVr7ag11wBPiand03Ar
         hfz1Q3OdP0SteCP40UEzmoIOdVfwTrWC3ilC/9F38K8jh1oWl45RnOiW9sQowEl4P2DM
         OFyBTFz8VWOLUpZkFtBkX05pZoDVVIFSfh/z+lOybmEmLJwEYzbY/nV0Roez/7W9lhAH
         WtBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692760098; x=1693364898;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CkQUyiTsYG+ARm3flGU77GSgWFGzu67vEgomaDrOEfI=;
        b=eGnB/GFjFAdZnU/L599BFnItnI4XVqN0Kn7BKoFGCLk8k1iajo5oev4Syi7IkTuHP6
         tJctfbJCRCKxzVa6tpdmQEg8OzQKb32fdKLs4yXmbLsLUEyluhto4Oo1z+KuVkfGpRjK
         tpHN3Xe5yi/OZLZLc7F7ElrCJ3R0OEKRONuMjsf5JuYN621pkeIG+GdTY7OCg0FHOnjm
         RHHWyPTz+7kmtckGkwkcTt47ENKxX4qLLXP0LlKiIAUFkJ5YjzaHBuCU88J2XKKPPcxo
         5ppe/bcQ09TVZRenuj+Vpwn2DUIn7p27PMRhBx/YizbqYxbK9hguoTjeMwniVlZeGa7w
         4gXw==
X-Gm-Message-State: AOJu0Yzk6VLbI06/BmIM1YdHitpAZJiTXUeaq7Y+6y6WFo3V0DTHR2NN
	RERhG/6ajeDwsXqyz8PLUwppUH9MQ9wv75E248BunQ==
X-Google-Smtp-Source: AGHT+IFhXdGl4kbxOz0waxEblWKMxE5OzgBpEp+1QZWpEAIEOL4kBNwmWDZg6+t9Vp1MusUWbtrMzlEP2XnArT6p7tw=
X-Received: by 2002:a0c:f387:0:b0:64f:42eb:92f3 with SMTP id
 i7-20020a0cf387000000b0064f42eb92f3mr7635149qvk.45.1692760097790; Tue, 22 Aug
 2023 20:08:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230822054739.33552-1-nick.hu@sifive.com> <CAAhSdy32DYoHpBKS3TF1SapM5fuMF5K00oqRxw8JF05v=DrUuw@mail.gmail.com>
 <CAKddAkDohdZqhjZKSawTg5NLMs0AXkL9SyYQr1q6vM1vm4Csfw@mail.gmail.com> <CAAhSdy0Yt-xcDYWz9BJCUgErpC2xM97yMXw4Wto078DKNk1nUg@mail.gmail.com>
In-Reply-To: <CAAhSdy0Yt-xcDYWz9BJCUgErpC2xM97yMXw4Wto078DKNk1nUg@mail.gmail.com>
From: Nick Hu <nick.hu@sifive.com>
Date: Wed, 23 Aug 2023 11:08:04 +0800
Message-ID: <CAKddAkBqUAwhftCiyoF3=tFM9cGTOnkYzeO=Cvsm3L7HAhiTMQ@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: suspend: Add syscore ops for suspend
To: Anup Patel <anup@brainfault.org>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	leyfoon.tan@starfivetech.com, mason.huo@starfivetech.com, 
	conor.dooley@microchip.com, jeeheng.sia@starfivetech.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	zong.li@sifive.com, Andy Chiu <andy.chiu@sifive.com>, 
	Andrew Jones <ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230822_200819_972129_B8CB0A56 
X-CRM114-Status: GOOD (  34.28  )
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

SGkgQW51cAoKVGhhbmtzIGZvciB5b3VyIGZlZWRiYWNrcwpPbiBUdWUsIEF1ZyAyMiwgMjAyMyBh
dCA1OjE34oCvUE0gQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4gd3JvdGU6Cj4KPiBP
biBUdWUsIEF1ZyAyMiwgMjAyMyBhdCAxOjI44oCvUE0gTmljayBIdSA8bmljay5odUBzaWZpdmUu
Y29tPiB3cm90ZToKPiA+Cj4gPiBIaSBBbnVwCj4gPgo+ID4KPiA+IE9uIFR1ZSwgQXVnIDIyLCAy
MDIzIGF0IDI6MTbigK9QTSBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPiB3cm90ZToK
PiA+ID4KPiA+ID4gT24gVHVlLCBBdWcgMjIsIDIwMjMgYXQgMTE6MTfigK9BTSBOaWNrIEh1IDxu
aWNrLmh1QHNpZml2ZS5jb20+IHdyb3RlOgo+ID4gPiA+Cj4gPiA+ID4gSWYgYSB0YXNrIGlzIHRo
ZSBvbmUgd2hvIHBlcmZvcm1zIHRoZSBzdXNwZW5kIGZsb3cgYW5kIGl0IGFsc28gZG8gc29tZQo+
ID4gPiA+IGZsb2F0aW5nIG9yIHZlY3RvciBvcGVyYXRpb25zIGJlZm9yZSB0aGUgc3VzcGVuZCwg
d2UgbWlnaHQgbG9zZSB0aGUgRlBVCj4gPiA+ID4gYW5kIHZlY3RvciBzdGF0ZXMgd2hlbiBpdCBn
b2VzIHRvIHRoZSBub24tcmV0ZW50aW9uIHN5c3RlbSBzdXNwZW5kIHN0YXRlLgo+ID4gPiA+IEFk
ZCBzeXNjb3JlIG9wcyB0byBzYXZlIGFuZCByZXN0b3JlIHRoZSBGUFUgYW5kIHZlY3RvciBzdGF0
ZXMgb2YgdGhlCj4gPiA+ID4gY3VycmVudCB0YXNrIHRvIGZpeCB0aGUgaXNzdWUgYWJvdmUuCj4g
PiA+Cj4gPiA+IFRoaXMgb25seSBhcHBsaWVzIHRvIG5vbi1yZXRlbnRpdmUgc3lzdGVtIHN1c3Bl
bmQgc28gd2h5IGRvIHdlIG5lZWQKPiA+ID4gdGhpcyBiZWZvcmUgU0JJIHN5c3RlbSBzdXNwZW5k
IGlzIG1lcmdlZCA/Cj4gPiA+Cj4gPiA+IFJlZ2FyZHMsCj4gPiA+IEFudXAKPiA+ID4KPiA+ID4K
PiA+IEhvdyBhYm91dCBoaWJlcm5hdGlvbj8KPgo+IElmIHRoaXMgaXMgZm9yIGhpYmVybmF0aW9u
IHRoZW4gdGhlIGNvbW1pdCBkZXNjcmlwdGlvbiBzaG91bGQgc2F5IHNvLgo+CkFjdHVhbGx5IHRo
aXMgY29tbWl0IGlzIGZvciB0aGUgc3VzcGVuZC10by1yYW0uIEkgYXNrIGFib3V0CmhpYmVybmF0
aW9uIGhlcmUgYmVjYXVzZSBJIHRoaW5rIGhpYmVybmF0aW9uIG1heSBhbHNvIGhhdmUgdGhlIHNh
bWUKaXNzdWUgdG9vLgpJZiBoaWJlcm5hdGlvbiBkb2Vzbid0IG5lZWQgaXQsIEkgY2FuIGRlZmVy
IHRoaXMgcGF0Y2ggdW50aWwgd2UgaGF2ZQpzeXN0ZW0gc3VzcGVuZC4KSSBzZW5kIHRoaXMgcGF0
Y2ggYmVjYXVzZSBJIGJlbGlldmUgd2Ugd2lsbCBzdXBwb3J0IHN5c3RlbSBzdXNwZW5kIGluCnRo
ZSBrZXJuZWwgc29vbiBvciBsYXRlciBhbmQgdGhlIGhpYmVybmF0aW9uIG1pZ2h0IG5lZWQgaXQg
bm93LgoKPiBBZGRpbmcgc3lzY29yZV9vcHMgd291bGQgbWVhbiB0aGVzZSBjYWxsYmFja3Mgd2ls
bCBiZSBjYWxsZWQgZm9yCj4gYm90aCBzdXNwZW5kLXRvLXJhbSBhbmQgaGliZXJuYXRlIGNhc2Vz
LiBPdGhlciBhcmNoaXRlY3R1cmVzIGRvbid0Cj4gaGF2ZSB0aGlzIHNhdmUvcmVzdG9yZSBmb3Ig
c3VzcGVuZC10by1yYW0gYmVjYXVzZSBpdCBpcyBnZW5lcmFsbHkKPiBjYWxsZWQgZnJvbSBpZGxl
IHRhc2suCj4KRG8geW91IHRoaW5rIHdlIGRvbid0IGhhdmUgdG8gY29uc2lkZXIgdGhlIGNhc2Ug
aW4gdGhlIHBhdGNoPwoKUmVnYXJkcywKTmljawo+IFdoeSBub3QgZG8gdGhlIHNhdmUvcmVzdG9y
ZSBpbiBzYXZlX3Byb2Nlc3Nvcl9zdGF0ZSgpIGFuZAo+IHJlc3RvcmVfcHJvY2Vzc29yX3N0YXRl
KCkganVzdCBsaWtlIGFyY2gvbWlwcy9wb3dlci9jcHUuYyA/Cj4KPiBSZWdhcmRzLAo+IEFudXAK
Pgo+Cj4gPgo+ID4gUmVnYXJkcywKPiA+IE5pY2sKPiA+ID4gPgo+ID4gPiA+IENvLWRldmVsb3Bl
ZC1ieTogQW5keSBDaGl1IDxhbmR5LmNoaXVAc2lmaXZlLmNvbT4KPiA+ID4gPiBTaWduZWQtb2Zm
LWJ5OiBBbmR5IENoaXUgPGFuZHkuY2hpdUBzaWZpdmUuY29tPgo+ID4gPiA+IFNpZ25lZC1vZmYt
Ynk6IE5pY2sgSHUgPG5pY2suaHVAc2lmaXZlLmNvbT4KPiA+ID4gPiAtLS0KPiA+ID4gPiBDaGFu
Z2VzIGluIHYyOgo+ID4gPiA+IGEpIEFkZCBDby1kZXZlbG9wZWQtYnkgYW5kIGFkanVzdCB0aGUg
b3JkZXIgb2Ygc2lnbmVkLW9mZgo+ID4gPiA+IGIpIFJlcGhyYXNlIHRoZSBjb21taXQgbWVzc2Fn
ZQo+ID4gPiA+Cj4gPiA+ID4gIGFyY2gvcmlzY3Yva2VybmVsL3N1c3BlbmQuYyB8IDQ1ICsrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiA+ID4gPiAgMSBmaWxlIGNoYW5nZWQs
IDQ1IGluc2VydGlvbnMoKykKPiA+ID4gPgo+ID4gPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2
L2tlcm5lbC9zdXNwZW5kLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zdXNwZW5kLmMKPiA+ID4gPiBp
bmRleCAzYzg5YjhlYzY5YzQuLmZmNjlmZjhhMTk3NCAxMDA2NDQKPiA+ID4gPiAtLS0gYS9hcmNo
L3Jpc2N2L2tlcm5lbC9zdXNwZW5kLmMKPiA+ID4gPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9z
dXNwZW5kLmMKPiA+ID4gPiBAQCAtNCw5ICs0LDE0IEBACj4gPiA+ID4gICAqIENvcHlyaWdodCAo
YykgMjAyMiBWZW50YW5hIE1pY3JvIFN5c3RlbXMgSW5jLgo+ID4gPiA+ICAgKi8KPiA+ID4gPgo+
ID4gPiA+ICsjaW5jbHVkZSA8bGludXgvY3B1X3BtLmg+Cj4gPiA+ID4gICNpbmNsdWRlIDxsaW51
eC9mdHJhY2UuaD4KPiA+ID4gPiArI2luY2x1ZGUgPGxpbnV4L3RocmVhZF9pbmZvLmg+Cj4gPiA+
ID4gKyNpbmNsdWRlIDxsaW51eC9zeXNjb3JlX29wcy5oPgo+ID4gPiA+ICAjaW5jbHVkZSA8YXNt
L2Nzci5oPgo+ID4gPiA+ICAjaW5jbHVkZSA8YXNtL3N1c3BlbmQuaD4KPiA+ID4gPiArI2luY2x1
ZGUgPGFzbS9zd2l0Y2hfdG8uaD4KPiA+ID4gPiArI2luY2x1ZGUgPGFzbS92ZWN0b3IuaD4KPiA+
ID4gPgo+ID4gPiA+ICB2b2lkIHN1c3BlbmRfc2F2ZV9jc3JzKHN0cnVjdCBzdXNwZW5kX2NvbnRl
eHQgKmNvbnRleHQpCj4gPiA+ID4gIHsKPiA+ID4gPiBAQCAtODUsMyArOTAsNDMgQEAgaW50IGNw
dV9zdXNwZW5kKHVuc2lnbmVkIGxvbmcgYXJnLAo+ID4gPiA+Cj4gPiA+ID4gICAgICAgICByZXR1
cm4gcmM7Cj4gPiA+ID4gIH0KPiA+ID4gPiArCj4gPiA+ID4gK3N0YXRpYyBpbnQgcmlzY3ZfY3B1
X3N1c3BlbmQodm9pZCkKPiA+ID4gPiArewo+ID4gPiA+ICsgICAgICAgc3RydWN0IHRhc2tfc3Ry
dWN0ICpjdXJfdGFzayA9IGdldF9jdXJyZW50KCk7Cj4gPiA+ID4gKyAgICAgICBzdHJ1Y3QgcHRf
cmVncyAqcmVncyA9IHRhc2tfcHRfcmVncyhjdXJfdGFzayk7Cj4gPiA+ID4gKwo+ID4gPiA+ICsg
ICAgICAgaWYgKGhhc19mcHUoKSkgewo+ID4gPiA+ICsgICAgICAgICAgICAgICBpZiAodW5saWtl
bHkocmVncy0+c3RhdHVzICYgU1JfU0QpKQo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
IGZzdGF0ZV9zYXZlKGN1cl90YXNrLCByZWdzKTsKPiA+ID4gPiArICAgICAgIH0KPiA+ID4gPiAr
ICAgICAgIGlmIChoYXNfdmVjdG9yKCkpIHsKPiA+ID4gPiArICAgICAgICAgICAgICAgaWYgKHVu
bGlrZWx5KHJlZ3MtPnN0YXR1cyAmIFNSX1NEKSkKPiA+ID4gPiArICAgICAgICAgICAgICAgICAg
ICAgICByaXNjdl92X3ZzdGF0ZV9zYXZlKGN1cl90YXNrLCByZWdzKTsKPiA+ID4gPiArICAgICAg
IH0KPiA+ID4gPiArCj4gPiA+ID4gKyAgICAgICByZXR1cm4gMDsKPiA+ID4gPiArfQo+ID4gPiA+
ICsKPiA+ID4gPiArc3RhdGljIHZvaWQgcmlzY3ZfY3B1X3Jlc3VtZSh2b2lkKQo+ID4gPiA+ICt7
Cj4gPiA+ID4gKyAgICAgICBzdHJ1Y3QgdGFza19zdHJ1Y3QgKmN1cl90YXNrID0gZ2V0X2N1cnJl
bnQoKTsKPiA+ID4gPiArICAgICAgIHN0cnVjdCBwdF9yZWdzICpyZWdzID0gdGFza19wdF9yZWdz
KGN1cl90YXNrKTsKPiA+ID4gPiArCj4gPiA+ID4gKyAgICAgICBpZiAoaGFzX2ZwdSgpKQo+ID4g
PiA+ICsgICAgICAgICAgICAgICBmc3RhdGVfcmVzdG9yZShjdXJfdGFzaywgcmVncyk7Cj4gPiA+
ID4gKyAgICAgICBpZiAoaGFzX3ZlY3RvcigpKQo+ID4gPiA+ICsgICAgICAgICAgICAgICByaXNj
dl92X3ZzdGF0ZV9yZXN0b3JlKGN1cl90YXNrLCByZWdzKTsKPiA+ID4gPiArfQo+ID4gPiA+ICsK
PiA+ID4gPiArc3RhdGljIHN0cnVjdCBzeXNjb3JlX29wcyByaXNjdl9jcHVfc3lzY29yZV9vcHMg
PSB7Cj4gPiA+ID4gKyAgICAgICAuc3VzcGVuZCAgICAgICAgPSByaXNjdl9jcHVfc3VzcGVuZCwK
PiA+ID4gPiArICAgICAgIC5yZXN1bWUgICAgICAgICA9IHJpc2N2X2NwdV9yZXN1bWUsCj4gPiA+
ID4gK307Cj4gPiA+ID4gKwo+ID4gPiA+ICtzdGF0aWMgaW50IF9faW5pdCByaXNjdl9jcHVfc3Vz
cGVuZF9pbml0KHZvaWQpCj4gPiA+ID4gK3sKPiA+ID4gPiArICAgICAgIHJlZ2lzdGVyX3N5c2Nv
cmVfb3BzKCZyaXNjdl9jcHVfc3lzY29yZV9vcHMpOwo+ID4gPiA+ICsgICAgICAgcmV0dXJuIDA7
Cj4gPiA+ID4gK30KPiA+ID4gPiArYXJjaF9pbml0Y2FsbChyaXNjdl9jcHVfc3VzcGVuZF9pbml0
KTsKPiA+ID4gPiAtLQo+ID4gPiA+IDIuMzQuMQo+ID4gPiA+CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
