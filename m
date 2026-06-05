Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 267C5CD6E7C
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Jun 2026 16:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x/MBICprcn5/NLVaeJCTM71Pf4dG8+f3lCub/b0E2zE=; b=ypUNmip9Mj2vbo
	Tjg+Qh3G/b3/chlMIMJ9AAjay+1Odm0CrX87yj1YTWH/kYd2uCfGAX7mFJsxjV/4EXWWy319aVQMV
	+zrisAHwPxtdNpjrScyjkfJCvJvpP/09MrCJMIxQpL9JqJmimS5zjTIg6F86gzx3oU+oweFRGwp0K
	RDUr/aranBKmjidZWZ5Sx5VYMxJSy2Mz1cCrPNkzGyvwY/2fcjVLgLCH39r3RKruxaT9N0tnCBxCt
	0iv/j2I3H5kKm1fxKGJCPxf+fJ642LLd+eOA8EY+i5wcRgOgrvgmpVkJhwi8Izz3eXpY0gzCEABDW
	mqr21lyfttkzy6VIlIMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVXED-00000000trH-2ZvF;
	Fri, 05 Jun 2026 16:17:01 +0000
Received: from mail-oo1-xc34.google.com ([2607:f8b0:4864:20::c34])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVXE9-00000000tq6-38UL
	for linux-riscv@lists.infradead.org;
	Fri, 05 Jun 2026 16:17:00 +0000
Received: by mail-oo1-xc34.google.com with SMTP id 006d021491bc7-69de16f5f79so942220eaf.0
        for <linux-riscv@lists.infradead.org>; Fri, 05 Jun 2026 09:16:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780676217; cv=none;
        d=google.com; s=arc-20240605;
        b=UH6yjlZuTzryKE+gPvVy/R+ql5VjPhEFM/m7muvWgUpndzs4zS+o6O6I7/TXlPrQ2N
         ckhPAvdc/1DTi6sjJymcpPzGlOXI56Z/lnEAAC6KLFZBEe0P2iQiyWlwhF6dyaCS/cyM
         XYvEbbTAw5IUpQwBWUBjmns/t9g7ZQtW+SBx0h4c422Tx7CUSk3j+2G5gRDCnfzbnMBn
         PatifQfcnxwhH/bKwhhXC/V8pmpPal5A9RD2iqZ2hpuj3pdcB0OnXR9ZV/uGQ0Z1obqG
         JKLSFflOoaar4O7Iomdw4Lf3WlmD6QY1/676zxqY9dMJ1i++pcXd8531L//kehquzhcL
         KBFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LFoazSpHOzu3D4nnNfNyUkpuHouoQrz86xgnRKO3Hjk=;
        fh=0VEIKGo1uX2foFxg/ZVeV2E+gi8jQuZH2Pv01NG/GrQ=;
        b=TD5i1oeV0rdf3AYpobxcPVjShCK5wMwBEXe5JyLQ4/+ukF/Th56OUswaApPY+nQGMA
         xa/YGKNS+vwNOYm0e9KqfuQKlmc3zTug2M8r1SRAGkWj2/1I7zEykV6gFsYjcnNqgHv8
         jA3JPYzjcFBdEFrU5AsAJzukvK4fhnOh7RV9EbvneezXZuATXk2VL+L47qRMz24NsvVc
         d/pFqD2QNg6XR/u8AIm0GQwq31AYAFW2b8g/1FdiJwqWa4Q0Cqu8bJJUDFt7D329aAK6
         KQEGwJpA6m+5STYDG4Li+GnEjG6bprqMD+ZT8mLfhTo99/8PkCgrdIDtoFCc/ptG0DaG
         4WxA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1780676217; x=1781281017; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LFoazSpHOzu3D4nnNfNyUkpuHouoQrz86xgnRKO3Hjk=;
        b=05uaFzwlieETlQRff/slSOSbyB2N5xoIanQ4rsjy/5UVpBTfFoxZyEMF9QJDzduma2
         4dm6zf6aGnpZi096czT7AVpj989cKHpD8AD1p41oux5ULKYWo13u+VUBxKK91ccXYA5C
         uaL3KlaTuyknx2B9bOzfrlCiU7XUdy78KXoGt5aO+SV9c6QYf0enITTYN6rznfnrJvLQ
         hHusDXnPQ1YuRtjDNaFohHAf60WtjsnDNESjn4yWAPXb0i6NB4Ed4NJa1oniTD3sb8MD
         hc1zal14pBh1a/+sZgrDaB6EcK0wPuKBRZTKcMiCiMaSi19nbg+wY6D/voizJQDg233n
         GlPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780676217; x=1781281017;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LFoazSpHOzu3D4nnNfNyUkpuHouoQrz86xgnRKO3Hjk=;
        b=lY9EKwDRl6LuMvA2ogkL3FCBdZxbtaYQ/ArBz25doF06I9cIBR+K7/k7Ht5ScKtbE1
         pSwYifnvRvA7sMIdXkzEiMklHhO4EFojMqnuYw4VsdsQUHs9r9vlUNjal1pZqCtAneaS
         H8jz4/u4xxaCRwZMEHYT8kaduwhynZKhJfgW7EWJN+UKZAyTZczkhb9YjGD11FZcHlAy
         bsG9IcM6kk5irOdjKTfnVwh199+v3ftvlmZSErpjcnZGA4jZmdqEFdNP37cLVQlAb3lr
         OV82X1O38PsnB2AuErgTcIwCgOnwaEnHntGFaWnwqKd6T60fhz34kMFLl+J00DC13WTU
         wsTg==
X-Forwarded-Encrypted: i=1; AFNElJ+qFmvQ/sG4EJ8+0U60vYz//lqm+wy5qqlX/i2+V5Qi6i18rJFW2IvMFaJcdY3SpqaCJgo+vceG3vVWFg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwxOXFLvmddw6ZBh3zd1NCS2Lcme7Y1UjAw3127U86TUz9a8nvF
	NZOgqSj2PgjXiEJKlTKikX+Xu0gpF/5YjtYjEU/Lw3AWrxBtsQIMzs5bQgax2lyPGNPeGyZJtSj
	TIT0EEMHnCOLUv36XZLtica3/3gYOpQltzkG4bGRdPA==
X-Gm-Gg: Acq92OGKNkpV1YAS5mhFszM3DlTYjHJsSznqpMRInoqq4iv1SdCEl9PZWV4OUEipfXf
	uRhkK77nI/tEBaTd5cwv8IQoWEz9c6hp1GsFByXZ92jg9WYyYuVzlAWs+SUFill/95qZn2mxrIS
	qOqUnuBykar8D5nwX941hUU0aA7d31J+koBkqfTS7Pysjc9UmrAd+AYtd85SBjgjVQWXN5VI/EN
	lABkJPeiHcL99yxH6ynyQK/7Tc0j+j+BxMzgVdXO2ixcFjiX8L1UdvFFTo7qf8adOlUUIxg3eGp
	7dPMdPI5p/I8s8YWVemYji0HZFk4d5sLpS6qZfxQECZt+J2fuF8WWSnW8BPOCW3xmF0GYzyFEal
	AwpPRHCjr7Hm8w3yu0NF0lMG94SyFazETQq09
X-Received: by 2002:a05:6820:621:b0:69d:ee54:babb with SMTP id
 006d021491bc7-69e68c7f707mr2648730eaf.46.1780676216681; Fri, 05 Jun 2026
 09:16:56 -0700 (PDT)
MIME-Version: 1.0
References: <20260601-kvm-get_reg_list-v2-v5-0-415d08a2813b@sifive.com>
In-Reply-To: <20260601-kvm-get_reg_list-v2-v5-0-415d08a2813b@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 5 Jun 2026 21:46:45 +0530
X-Gm-Features: AVVi8CfqxZG-V8UYX903THbico9wP-cudNBEPgakg_WBZYUItP5SdwW-rpbB-E4
Message-ID: <CAAhSdy1bMSadxaoKvSy6fdfb9pLufg=39-sHOHnr7Vj0Y-4Z2w@mail.gmail.com>
Subject: Re: [PATCH v5 0/5] KVM: riscv: Fix stale FWFT feature exposure and
 enhance selftests
To: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Cc: Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, greentime.hu@sifive.com, vincent.chen@sifive.com, 
	zong.li@sifive.com, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, inochiama@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_091658_114224_3194721D 
X-CRM114-Status: GOOD (  16.18  )
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

T24gTW9uLCBKdW4gMSwgMjAyNiBhdCAzOjU24oCvUE0gWW9uZy1YdWFuIFdhbmcgPHlvbmd4dWFu
LndhbmdAc2lmaXZlLmNvbT4gd3JvdGU6Cj4KPiBUaGlzIHNlcmllcyBmaXhlcyB0aHJlZSBidWdz
IGluIHRoZSBTQkkgRldGVCAoRmlybXdhcmUgRmVhdHVyZXMpIGV4dGVuc2lvbgo+IGFuZCBpbXBy
b3ZlcyB0aGUgcmVsYXRlZCBzZWxmdGVzdCBpbmZyYXN0cnVjdHVyZS4KPiBUaGUgYnVncyBhcmU6
Cj4gMS4gTWlzc2luZyBDU1IgZGlydHkgbWFya2luZzogV2hlbiB1c2Vyc3BhY2Ugc2V0cyBGV0ZU
IGZlYXR1cmUgdmFsdWVzIHZpYQo+ICAgIEtWTV9TRVRfT05FX1JFRywgbW9kaWZpZWQgQ1NScyAo
ZS5nLiwgaGVudmNmZy5QTU0gZm9yIHBvaW50ZXIgbWFza2luZykKPiAgICBhcmUgbm90IG1hcmtl
ZCBkaXJ0eSwgbGVhZGluZyB0byBzdGFsZSBzdGF0ZSBhZnRlciB2Q1BVIHNjaGVkdWxpbmcgb3IK
PiAgICBtaWdyYXRpb24uCj4gMi4gSGFyZHdhcmUgcHJvYmluZyBzaWRlIGVmZmVjdHM6IFRoZSB0
cnlfdG9fc2V0X3BtbSgpIGZ1bmN0aW9uIG1vZGlmaWVzCj4gICAgSEVOVkNGRy5QTU0gZHVyaW5n
IGhhcmR3YXJlIGNhcGFiaWxpdHkgZGV0ZWN0aW9uIGJ1dCBmYWlscyB0byByZXN0b3JlCj4gICAg
dGhlIG9yaWdpbmFsIHZhbHVlLCBsZWF2aW5nIHRoZSBDU1IgaW4gYW4gYWx0ZXJlZCBzdGF0ZSB0
aGF0IGFmZmVjdHMKPiAgICBzdWJzZXF1ZW50IG9wZXJhdGlvbnMuCj4gMy4gU3RhbGUgZmVhdHVy
ZSBleHBvc3VyZTogRldGVCBmZWF0dXJlIHN1cHBvcnQgaXMgY2FjaGVkIGF0IHZDUFUKPiAgICBp
bml0aWFsaXphdGlvbiB0aW1lLiBXaGVuIHVzZXJzcGFjZSBzdWJzZXF1ZW50bHkgZGlzYWJsZXMg
SVNBIGV4dGVuc2lvbnMKPiAgICB2aWEgS1ZNX1NFVF9PTkVfUkVHLCB0aGUgY2FjaGVkIHN1cHBv
cnQgc3RhdHVzIGlzIG5vdCB1cGRhdGVkLCBhbGxvd2luZwo+ICAgIGd1ZXN0cyB0byBhY2Nlc3Mg
ZmVhdHVyZXMgdGhhdCBkZXBlbmQgb24gZGlzYWJsZWQgZXh0ZW5zaW9ucy4KPiBQYXRjaGVzIDEt
MyBmaXggdGhlc2UgYnVncyBzZXBhcmF0ZWx5Lgo+Cj4gVGhlIHNlbGZ0ZXN0IGltcHJvdmVtZW50
cyAocGF0Y2hlcyA0LTUpIGVuaGFuY2UgdGhlIGdldC1yZWctbGlzdCB0ZXN0IGJ5Cj4gcmVmYWN0
b3JpbmcgdGhlIGV4dGVuc2lvbiBzdWJsaXN0IGluZnJhc3RydWN0dXJlIGFuZCBzcGxpdHRpbmcg
RldGVAo+IGZlYXR1cmUgdGVzdGluZyBpbnRvIHNlcGFyYXRlLCBwcm9wZXJseS1nYXRlZCBzdWJs
aXN0cy4KPgo+IC0tLQo+IENoYW5nZXMgaW4gdjU6Cj4gLSBBZGQgQ1NSIGRpcnR5IG1hcmtpbmcg
Zml4IChuZXcgcGF0Y2ggMS81KSAoc2FzaGlrby1ib3QpCj4gLSBTcGxpdCBvcmlnaW5hbCBGV0ZU
IGJ1ZyBmaXggaW50byB0d28gZm9jdXNlZCBwYXRjaGVzCj4gICAtIEFkZCBpbml0KCkgY2FsbGJh
Y2sgd2l0aCB0cnlfdG9fc2V0X3BtbSgpIHJlc3RvcmF0aW9uIGZpeCAobmV3IHBhdGNoCj4gICAg
IDIvNSkgKHNhc2hpa28tYm90KQo+ICAgLSBLZWVwIHJ1bnRpbWUgc3VwcG9ydGVkKCkgY2hlY2tz
IGFzIHNlcGFyYXRlIHBhdGNoIChwYXRjaCAzLzUpCj4gLSBMaW5rIHRvIHY0OiBodHRwczovL3Bh
dGNoLm1zZ2lkLmxpbmsvMjAyNjA2MDEta3ZtLWdldF9yZWdfbGlzdC12Mi12NC0wLWM4OGFiYzgx
ZWJkYUBzaWZpdmUuY29tCj4KPiBDaGFuZ2VzIGluIHY0Ogo+IC0gUmVuYW1lIHRoZSB0aXRsZSBv
ZiBjb3ZlciBsZXR0ZXIKPiAtIERpc2FibGUgcHJlZW1wdGlvbiB3aGVuIHJ1bm5pbmcgdHJ5X3Rv
X3NldF9wbW0oKSAoc2FzaGlrby1ib3QpCj4gLSBSZW1vdmUgY2hlY2tfc3VwcG9ydGVkX3JlZygp
IChzYXNoaWtvLWJvdCkKPiAtIExpbmsgdG8gdjM6IGh0dHBzOi8vcGF0Y2gubXNnaWQubGluay8y
MDI2MDUyOC1rdm0tZ2V0X3JlZ19saXN0LXYyLXYzLTAtMTcwOTY5YTg1OTlmQHNpZml2ZS5jb20K
Pgo+IENoYW5nZXMgaW4gdjM6Cj4gLSBSZXN0b3JlICdzdXBwb3J0ZWQnIGZpZWxkIHdpdGggaW5p
dCgpIGNhbGxiYWNrIGZvciBpbml0aWFsaXphdGlvbiBwcm9iaW5nCj4gICAoc2FzaGlrby1ib3Qp
Cj4gLSBBZGQgTlVMTCBjaGVja3MgYmVmb3JlIGNhbGxpbmcgZmVhdHVyZS0+c3VwcG9ydGVkKCkg
aW4gYWxsIGZ1bmN0aW9ucwo+IC0gRml4IGlzYV9leHRfZW5hYmxlZCB0cmFja2luZyBsb2dpYyBh
bmQgcmVzdG9yZSBpc2FfZXh0X2NhbnRfZGlzYWJsZSBhcnJheQo+IC0gQWRkIHNiaV9leHRfZW5h
YmxlZCB0cmFja2luZyBhbmQgZW5oYW5jZSBkZXBlbmRlbmN5IGNoZWNraW5nIChzYXNoaWtvLWJv
dCkKPiAtIFJlZmluZSBjb2RlIG9yZ2FuaXphdGlvbiBhbmQgdmFyaWFibGUgbmFtaW5nIGNvbnNp
c3RlbmN5IChzYXNoaWtvLWJvdCkKPiAtIExpbmsgdG8gdjI6IGh0dHBzOi8vcGF0Y2gubXNnaWQu
bGluay8yMDI2MDUyNi1rdm0tZ2V0X3JlZ19saXN0LXYyLXYyLTAtNzk0MGE0MDE0NTRhQHNpZml2
ZS5jb20KPgo+IENoYW5nZXMgaW4gdjI6Cj4gLSBGaXggRldGVCBzdGFsZSBmZWF0dXJlIGV4cG9z
dXJlIGJ5IHJlbW92aW5nIHN0YXRpYyAnc3VwcG9ydGVkJyBmaWVsZAo+IC0gUmVmYWN0b3IgZ2V0
LXJlZy1saXN0IHRlc3QgdG8gdXNlIHVuaWZpZWQgZXh0ZW5zaW9uIHN1Ymxpc3QgbWFjcm9zCj4g
LSBTcGxpdCBGV0ZUIHRlc3RpbmcgaW50byBwZXItZmVhdHVyZSBzdWJsaXN0cyB3aXRoIHJ1bnRp
bWUgY2hlY2tzCj4gICAoQW5kcmV3KQo+Cj4gVG86IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVs
dC5vcmc+Cj4gVG86IEF0aXNoIFBhdHJhIDxhdGlzaC5wYXRyYUBsaW51eC5kZXY+Cj4gVG86IFBh
dWwgV2FsbXNsZXkgPHBqd0BrZXJuZWwub3JnPgo+IFRvOiBQYWxtZXIgRGFiYmVsdCA8cGFsbWVy
QGRhYmJlbHQuY29tPgo+IFRvOiBBbGJlcnQgT3UgPGFvdUBlZWNzLmJlcmtlbGV5LmVkdT4KPiBU
bzogQWxleGFuZHJlIEdoaXRpIDxhbGV4QGdoaXRpLmZyPgo+IFRvOiBDbMOpbWVudCBMw6lnZXIg
PGNsZWdlckByaXZvc2luYy5jb20+Cj4gVG86IEFuZHJldyBKb25lcyA8YWpvbmVzQHZlbnRhbmFt
aWNyby5jb20+Cj4gVG86IFBhb2xvIEJvbnppbmkgPHBib256aW5pQHJlZGhhdC5jb20+Cj4gVG86
IFNodWFoIEtoYW4gPHNodWFoQGtlcm5lbC5vcmc+Cj4gQ2M6IGdyZWVudGltZS5odUBzaWZpdmUu
Y29tCj4gQ2M6IHZpbmNlbnQuY2hlbkBzaWZpdmUuY29tCj4gQ2M6IHpvbmcubGlAc2lmaXZlLmNv
bQo+IENjOiBrdm1Admdlci5rZXJuZWwub3JnCj4gQ2M6IGt2bS1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCj4gQ2M6IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPiBDYzogbGludXgt
a2VybmVsQHZnZXIua2VybmVsLm9yZwo+IENjOiBsaW51eC1rc2VsZnRlc3RAdmdlci5rZXJuZWwu
b3JnCj4KPiAtLS0KPiBZb25nLVh1YW4gV2FuZyAoNSk6Cj4gICAgICAgS1ZNOiBSSVNDLVY6IFNC
SSBGV0ZUOiBNYXJrIHZDUFUgQ1NScyBkaXJ0eSBhZnRlciBzZXR0aW5nIGZlYXR1cmUgdmFsdWUK
PiAgICAgICBLVk06IFJJU0MtVjogU0JJIEZXRlQ6IEFkZCBvcHRpb25hbCBpbml0KCkgY2FsbGJh
Y2sgZm9yIGhhcmR3YXJlIHByb2JpbmcKPiAgICAgICBLVk06IFJJU0MtVjogU0JJIEZXRlQ6IEZp
eCBzdGFsZSBmZWF0dXJlIGV4cG9zdXJlIGFmdGVyIHJ1bnRpbWUgZXh0ZW5zaW9uIGNoYW5nZXMK
PiAgICAgICBLVk06IHJpc2N2OiBzZWxmdGVzdHM6IFJlZmFjdG9yIElTQSBhbmQgU0JJIGV4dGVu
c2lvbiBzdWJsaXN0IG1hY3Jvcwo+ICAgICAgIEtWTTogcmlzY3Y6IHNlbGZ0ZXN0czogU3BsaXQg
U0JJIEZXRlQgaW50byBzZXBhcmF0ZSBmZWF0dXJlLXNwZWNpZmljIHN1Ymxpc3RzCgpRdWV1ZWQg
dGhpcyBzZXJpZXMgZm9yIExpbnV4LTcuMgoKUmVnYXJkcywKQW51cAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
