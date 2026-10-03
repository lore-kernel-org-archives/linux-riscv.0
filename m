Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DAF3CA5FE3
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Oct 2026 09:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fn+G9qvq8MWSg5prdTJtAe+jCB79RTOu5GnAFJJqXu0=; b=r0oPZjT96haWWW
	LKnKzkOks3ZKnQWq25luPUZMKeRnIfKjLmRvfLkCpq5NORIuln9F6gTjbvIPnN7imVP31wGeYLbh9
	vtHGzf1u9NfQQG8qhHqU5gdmVXrfNc8QttfSS8ql6uyJAxbPhHu29yUE3868HeECBmEuOykpAfgfV
	Kyf0pAkQNF4xeiyWoDQUhLO+jPMM9x41JV0i6Qd1/m7Vd6DmFo66j8XLLBCSGb3SRw2GelO2baEVf
	4fZa5pZc4qcfyeJGqKktmblzkq7/C/DH8z1bv6TZEGILP9UXpCV8DQLu8Fp3ebsEr60ERe3sgyC8y
	spiC/gLXpfgFUGAI+D2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCvu6-0000000DFhl-1Oew;
	Sat, 03 Oct 2026 09:19:38 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCvu2-0000000DFgP-2Szx
	for linux-riscv@lists.infradead.org;
	Sat, 03 Oct 2026 09:19:36 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-48b9d8055dfso198270f8f.3
        for <linux-riscv@lists.infradead.org>; Sat, 03 Oct 2026 02:19:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791019173; cv=none;
        d=google.com; s=arc-20260327;
        b=SUdLIxzg+lVurm2wDbqOj+jOz9qvbVl8bpcSUBIqkF1SdrwHXTx9E0APE68cODGMd0
         LJWI9a7A0YTj699D12WLwEpKVGx5Z0FCd55pPz3D/FiMuxvDJpb4hPGLwV07g96TNLLk
         gyD9qA84PwrN8wcOUwdXX9aCN9+HP7aT8g7U/d7lztD043QVELgMJJRIIJoZ3lwcrKsd
         xfY3NDaBaya/+WcqfCWh8ALWXKcvfVxv9+6iHMH5ydOsGlzJvFS7yGnCE5qit0WVPYQb
         jULlFLMJhBtIj3Y/hjHn/ARcEFYQD/rTjAAIbMaQ0paozJn7cF0dS9LcI/xGuitRfV/T
         bKJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RCYMl+WZz2TETrAyEjwYvYxJTxXlvc4VUXVoz9zxqJk=;
        fh=YbYgGP0hgHbNlhxi8eMI/SVsZMhwyfGvWXZCXkhQ3hs=;
        b=ikpuYdhugZI5v2kNzIgdZ9/xpp2IzL+odebS/0YW74n+nJqHzlqPAADOs8R3ob5y48
         nRejK+0JEjuVzXkVYKD81gPEaQJaV5xd84uI/Fma3Q3hScZaOBVv1pmEwlYhWNoyRMx9
         vBEr9hJQElQNhV8Np4PkGKGPLeLBz33HZ5nU5UCoNMdDcHjaznoMNbtV3p3LBAmI5wJO
         +9IAKORu53dlsauBE/9vjYN2KDoahK101chZhXAaPCG4ANlaRz6tTkN5m8gsYOwbv4DW
         /1nk80diErnUgVAKuqtDsg26eEHkLamuW0fGU2P/KEGoJiEexQwhXhDCR0nYlOkD08jP
         zPKA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1791019173; x=1791623973; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RCYMl+WZz2TETrAyEjwYvYxJTxXlvc4VUXVoz9zxqJk=;
        b=t42Bi9VJJX9qzlllwX1wuhwj0HjASm9rqkCuk8GkYabQr9umAFzmwUdpXJAX3NC31l
         ICp4HnrcmpIw3P6Ofe8OxiO7O4eDfDhZGzrdfQPkc2yYd7ItdxDOnEql8LizcFAwwmnz
         pkaJxxkgsCYq6/1IMkb38kAfQKoeui5BPFJce18HJeZlw7V2ET7NNVxqnFnVibpeuoMX
         0eGPDGSVqLC0uGrz3aCDLoyvYumdzETqyLuHcE8ndi6YfWGy3ewbbGM1ZlTDCzk+NjKI
         ux8EMnlVdL3Z/p8itZr7ML9BN7GT4mhJ0gcI91Jg9oO/Tc2WM00sIOGnRrMDbcL4a+0b
         4AxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791019173; x=1791623973;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RCYMl+WZz2TETrAyEjwYvYxJTxXlvc4VUXVoz9zxqJk=;
        b=bgIlkHcJw0ww6PvlOoEAl2oSXwxSKDPdCCC6lo+YTuO+gN/dCTnmLbzb0eQI6nETq0
         +57Fa/zkSMZFdEWvq774l8ABoGdKCTyoIdVvcEpfb/9zixTUj5lFbiRbQTVIZfkwzv+V
         3LSz7UJQlQmHvwZvpuCI2uih5wRIkwUP8mBfAjpPID/CteuF9Xq1Ng0ARipWf6iTIgAf
         T2YAqP7Z8OSfk0KAcyc5d7+hlVi6RZumPRIj27gH22YlolAyDh3A+lVq07dX9S12xlx5
         W1qqmi9zcSTUjH7y10OmGEjlQTwAoUjWVpJ0fgc0BRN5hrdP3HyiNY6J4M9z/V9Ueq1A
         g8Vg==
X-Forwarded-Encrypted: i=1; AKwUvBy3+joB3Le2VFE/qiZvn8i0GhcT/nQe1yXe8QmPAGblJ4adpJ52qNkaufSW24yoLom/9XAkq6ta3pzD+Q==@lists.infradead.org
X-Gm-Message-State: AFq9FYLwwuXFIxwzyKD0dZecZ3LMc9n94opyVczLNkRdk9n+4e+dD5T+
	5/WUgoRLEQJ8XYSpKV/iBO+IU7mOW4Tb/AIA0QvUrNC6kCDO9Pir+/DCEQz5OFpO46/bjz/dIrz
	u68b8gCZ+xvtLb955KEQV+fEOUYWJqIFicS5WdepxNLPFLU4UqfxPz34=
X-Gm-Gg: AYBFou3QnbECwKm0ee8Uz8jYG64Cfd+ywtNvM++1XApEQVwLrVPxXuUIujn5L8md5lk
	oxZNrIlSk5f60RHJ2+RTuiRwc2+HWkdLbuAIbf/oMNH2y4dldFuEAtNzXEYZXBaOT1WA1/VUZzv
	qHyO4YKaUGZDWr/IBPfaIwQtQ2v5tjthu43lunjpbShrX5+j1taAQBZLQUQKVJ6hdRL94Ilc259
	4GCFHp8FkXPskDin0VNR8MDYNTZZYT/PIMT+UaKp4I4oC9u8Tp7WiAJEUSDWt5AUVY9ypdAsUQb
	Qqn8LIXWmPuK3BqYNaTCXaWY4pM9V5RxHf7fTwvNONTEXR/gUQ06P1mNPGRsSggnSV5EKi0yu4a
	XhCGYb7acjw5P0cJFtb28KN1NwE1k54uDuGUn8EDJ3t7tjIqlDtV3NQyEJImdrV2y1JAqO5N+fa
	4=
X-Received: by 2002:a05:6000:2289:b0:488:8546:d0b2 with SMTP id
 ffacd0b85a97d-48c48023a32mr2361761f8f.51.1791019172398; Sat, 03 Oct 2026
 02:19:32 -0700 (PDT)
MIME-Version: 1.0
References: <20260814123541.593613-1-jinyu.tang@linux.dev>
In-Reply-To: <20260814123541.593613-1-jinyu.tang@linux.dev>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 3 Oct 2026 14:49:19 +0530
X-Gm-Features: AclHuK_Z0ksFSJd3YPpKJCJ3vTWpyr047A-VUpiGpFpHWBI599qCSz9eVjsltbU
Message-ID: <CAAhSdy2TuVK==x2Ewj_yNhG=MkYx+Lrha8aPFA=ROociaG7dGw@mail.gmail.com>
Subject: Re: [PATCH] KVM: riscv: Avoid redundant interrupt check for pending timers
To: Jinyu Tang <jinyu.tang@linux.dev>
Cc: Anup Patel <apatel@ventanamicro.com>, Atish Patra <atish.patra@linux.dev>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Nutty Liu <nutty.liu@hotmail.com>, Jinyu Tang <tjytimi@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_021934_647422_0B8FBE6F 
X-CRM114-Status: GOOD (  13.91  )
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

T24gRnJpLCBBdWcgMTQsIDIwMjYgYXQgNjowNuKAr1BNIEppbnl1IFRhbmcgPGppbnl1LnRhbmdA
bGludXguZGV2PiB3cm90ZToKPgo+IGt2bV92Y3B1X2NoZWNrX2Jsb2NrKCkgY2FsbHMga3ZtX2Fy
Y2hfdmNwdV9ydW5uYWJsZSgpIGJlZm9yZQo+IGNoZWNraW5nIHdoZXRoZXIgYSB0aW1lciBpcyBw
ZW5kaW5nLiBPbiBSSVNDLVYsIGt2bV9hcmNoX3ZjcHVfcnVubmFibGUoKQo+IGFscmVhZHkgY2hl
Y2tzIGFsbCBwZW5kaW5nIGd1ZXN0IGludGVycnVwdHMgdGhyb3VnaAo+IGt2bV9yaXNjdl92Y3B1
X2hhc19pbnRlcnJ1cHRzKHZjcHUsIC0xVUwpLCBpbmNsdWRpbmcgSVJRX1ZTX1RJTUVSLgo+Cj4g
RHJvcCB0aGUgcmVwZWF0ZWQgSVJRX1ZTX1RJTUVSIHBlbmRpbmctaW50ZXJydXB0IGNoZWNrIGZy
b20KPiBrdm1fcmlzY3ZfdmNwdV90aW1lcl9wZW5kaW5nKCkgYW5kIGtlZXAgdGhlIGhlbHBlciBm
b2N1c2VkIG9uIHRoZSB0aW1lcgo+IGRlYWRsaW5lIHN0YXRlLiBJZiB0aGUgdGltZXIgYmVjb21l
cyBwZW5kaW5nIGFmdGVyIHRoZSBydW5uYWJsZSBjaGVjaywKPiB0aGUgdGltZXIgcGF0aCBzdGls
bCBpbmplY3RzIElSUV9WU19USU1FUiBhbmQga2lja3MgdGhlIHZDUFUgdGhyb3VnaCB0aGUKPiBu
b3JtYWwgd2FrZXVwIHBhdGguCj4KPiBTaWduZWQtb2ZmLWJ5OiBKaW55dSBUYW5nIDxqaW55dS50
YW5nQGxpbnV4LmRldj4KCkxHVE0uCgpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFp
bmZhdWx0Lm9yZz4KClF1ZXVlZCB0aGlzIHBhdGNoIGZvciBMaW51eC03LjQKClRoYW5rcywKQW51
cAoKCj4gLS0tCj4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfdGltZXIuYyB8IDYgKy0tLS0tCj4gIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgNSBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1n
aXQgYS9hcmNoL3Jpc2N2L2t2bS92Y3B1X3RpbWVyLmMgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X3Rp
bWVyLmMKPiBpbmRleCBhZTUzMTMzYzdhYjAuLjBlMDFiZDc5Mzc3MiAxMDA2NDQKPiAtLS0gYS9h
cmNoL3Jpc2N2L2t2bS92Y3B1X3RpbWVyLmMKPiArKysgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X3Rp
bWVyLmMKPiBAQCAtMTMyLDExICsxMzIsNyBAQCBib29sIGt2bV9yaXNjdl92Y3B1X3RpbWVyX3Bl
bmRpbmcoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQo+ICAgICAgICAgc3RydWN0IGt2bV92Y3B1X3Rp
bWVyICp0ID0gJnZjcHUtPmFyY2gudGltZXI7Cj4gICAgICAgICBzdHJ1Y3Qga3ZtX2d1ZXN0X3Rp
bWVyICpndCA9ICZ2Y3B1LT5rdm0tPmFyY2gudGltZXI7Cj4KPiAtICAgICAgIGlmICgha3ZtX3Jp
c2N2X2RlbHRhX2N5Y2xlczJucyh0LT5uZXh0X2N5Y2xlcywgZ3QsIHQpIHx8Cj4gLSAgICAgICAg
ICAga3ZtX3Jpc2N2X3ZjcHVfaGFzX2ludGVycnVwdHModmNwdSwgMVVMIDw8IElSUV9WU19USU1F
UikpCj4gLSAgICAgICAgICAgICAgIHJldHVybiB0cnVlOwo+IC0gICAgICAgZWxzZQo+IC0gICAg
ICAgICAgICAgICByZXR1cm4gZmFsc2U7Cj4gKyAgICAgICByZXR1cm4gIWt2bV9yaXNjdl9kZWx0
YV9jeWNsZXMybnModC0+bmV4dF9jeWNsZXMsIGd0LCB0KTsKPiAgfQo+Cj4gIHN0YXRpYyB2b2lk
IGt2bV9yaXNjdl92Y3B1X3RpbWVyX2Jsb2NraW5nKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKPiAt
LQo+IDIuNDMuMAo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
