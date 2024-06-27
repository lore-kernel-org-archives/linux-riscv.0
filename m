Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D365C3064D
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Jun 2024 11:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yQaRvfgQc5ttbJI0ZmspcX5LknDSe9KaWx4jN2RhQNA=; b=mEWJjT6MOgLJ8n
	2UgB4JyMh0JWhqfChLL4JwhyoEvl8xrjuu5idDEsGtdPfC2F9WBJn+dJCrL9kj94+soRbAqkbfvug
	dtEw6o437AH6b+a0uwJ7fBeMDVfQjNRSwqP+JS/BzWv0+UjCps7x9vhU4l5qT4N1eVtHlxXAPHpLx
	UX/3csv9CUs2xgqllgZh4gthfddmJ4MQnKQ2T6FS8pQrp/SWk26v32ozo1TP+ZlYWUNmLnc1QHX84
	g/OuN0UjpGvwez5KygJLrrZnHHzYae5yK0NO9sMvafXhmkrn2kVoUqWSkfaRdA1QTOC5Fspwqrlxu
	lty3jv4fOMtTbCRcArrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMnFa-0000000A9JW-2Trf;
	Thu, 27 Jun 2024 11:25:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMnE6-0000000A96Q-2lgJ
	for linux-riscv@bombadil.infradead.org;
	Thu, 27 Jun 2024 11:23:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=7ds3uXyhOspb83UzynorfT4bxuHOUyg4DsTQJ3YvqP8=; b=Uee7BopxXtc9Px31uhHnuNFdlJ
	TNk5KGfUyKje40naGCMkltFuxbCZAWGCuRe8BhnK7+YXtZhtTjxNfxqbZ5b+CjmjOdtFEnAhwm2Dn
	Vi0iZ61YSGQSgNu1xPealpc/t1JDO4dk8lJqG02shOIlYKH4noVhL3I/7aMt5mf/U52XotpG4G0Mw
	DVcztuyNmQ+qJIOdGuJaNvqI1/I2F7jj/HhCla1B4W8Tu4y9flQ190SIrUzZ+TMRizq0VqWoee9x1
	+/jSb+3wmO2YCQpCaPWUuCh4IFN/Aej9h/HOxiirP3bLM2wQM9jVKxA/tSvsAdGlNtZwvrFbWREN3
	0uond8QA==;
Received: from mail-ua1-x92f.google.com ([2607:f8b0:4864:20::92f])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMlez-00000008oYN-13RL
	for linux-riscv@lists.infradead.org;
	Thu, 27 Jun 2024 09:44:04 +0000
Received: by mail-ua1-x92f.google.com with SMTP id a1e0cc1a2514c-80d64c81784so1720577241.3
        for <linux-riscv@lists.infradead.org>; Thu, 27 Jun 2024 02:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1719481395; x=1720086195; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ds3uXyhOspb83UzynorfT4bxuHOUyg4DsTQJ3YvqP8=;
        b=D28SCP7fDKuui7woWf9KV6JiflXZv8Dzcbv0nG+rHo01f+qauEizUTBr8+qOtnKKqy
         /vgY/bwYVt/znbPUZ/odw9jl+RG1rjbAipXSoEqR+vWHcS12ZplUYcXK+sFQdXwiA1hr
         E/82cgLZ73Ia7LJtm4VMjFNmjwoZ+Ky93ud42eS623/tsDZOp0RK6tNOliqFLFp4/f1W
         C2uXoLWx8J+ppPr4JZQ/jjQgen6FH/BG3rOldI0PJej0cKNcf+kYpuI6iiJ8S9ySN0aA
         yLg5HC6xM6SrqrY+5ToFKsxrrb4NhmCC9tRDmiA1EcyRQnbDwcQhRiAJRD/GWXLzEUEy
         3oPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719481395; x=1720086195;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7ds3uXyhOspb83UzynorfT4bxuHOUyg4DsTQJ3YvqP8=;
        b=EzCSkyQBKuOjzszUKr9atETM0FCuvRhfrx8DTdO/3UtglcWkMMu+AZI6hbvu9pBHwq
         9bmbUYXNE7kgEabB4q64YxQxmgMMk+ospr5DP2613Hh8/EEL2wAZFEzanaHtYlgrIQzX
         LMI1HtX8RzFQIi2bhId/nPqRcGZRy7lEl5lRrf/SzLoCNoEPPJf8Fhxo1FAqEK/EW9Kp
         /nm8TEafv6KghXU9KDqorhz23OYLQgmZme3nbsp/AcY1c7y0Du9GPzOlzgbx84spMcSy
         zV592Tkye1G7gyYyTVlJQhqPMPUcm5KCxVGEQNmXlwWOk2pq/qS1PkIESRXOZZ6HGthj
         MZsw==
X-Forwarded-Encrypted: i=1; AJvYcCXBh86KHfL8hJ3IYxkC8XKS5aorve9hvtDKAxptRAl54EbQ6F3IG76AM1Jvr0aRzkW61APhuIVri2RN8hh+zbkc1K5dvCT6jzBDh8JxrBlg
X-Gm-Message-State: AOJu0YyrO+EZ5nRwkqywDQUmEEkT79BAzr4cpZ3i+kjKsSg9IiCuUaVy
	6Rq4V2U4u1I4Qbb4Z1XrNsQiKpMCH+CqCmso1TdN0EMk+dBP9N0FRZ4TzF5lsigJvr73Dmj924k
	jyNTMu34ugremj5+s5qsIzRNz1t28MmLnDeKl
X-Google-Smtp-Source: AGHT+IGBv4Bbs/pbeMHJtmkvCt7f3IJTYs0gdhLR2HxVvY14nRCrzCgTvdwfbnoRZj4htMw/nyBIq9PpMl3hVx/x6jo=
X-Received: by 2002:a05:6102:361:b0:48f:508b:d3ec with SMTP id
 ada2fe7eead31-48f52946e34mr10434786137.4.1719481394805; Thu, 27 Jun 2024
 02:43:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230801141607.435192-1-CoelacanthusHex@gmail.com>
 <20240627071422.GA2626@altlinux.org> <9c102328-6bb3-46b6-bc2f-d011a284d5b0@gmail.com>
In-Reply-To: <9c102328-6bb3-46b6-bc2f-d011a284d5b0@gmail.com>
From: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>
Date: Thu, 27 Jun 2024 11:43:03 +0200
Message-ID: <CA+FstbVf7TJx==WsY5fBoFrdeY8php5ETn8kMq5s6YScy-2O=A@mail.gmail.com>
Subject: Re: [PATCH v5] riscv: entry: set a0 = -ENOSYS only when syscall != -1
To: Celeste Liu <coelacanthushex@gmail.com>
Cc: "Dmitry V. Levin" <ldv@strace.io>, Palmer Dabbelt <palmer@rivosinc.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Guo Ren <guoren@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Andreas Schwab <schwab@suse.de>, David Laight <David.Laight@aculab.com>, 
	Felix Yan <felixonmars@archlinux.org>, Ruizhe Pan <c141028@gmail.com>, 
	Shiqi Zhang <shiqi@isrc.iscas.ac.cn>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>, "Ivan A. Melnikov" <iv@altlinux.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_104328_454986_38F5AD83 
X-CRM114-Status: GOOD (  30.36  )
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

T24gVGh1LCBKdW4gMjcsIDIwMjQgYXQgOTo0N+KAr0FNIENlbGVzdGUgTGl1IDxjb2VsYWNhbnRo
dXNoZXhAZ21haWwuY29tPiB3cm90ZToKPgo+IE9uIDIwMjQtMDYtMjcgMTU6MTQsIERtaXRyeSBW
LiBMZXZpbiB3cm90ZToKPgo+ID4gSGksCj4gPgo+ID4gT24gVHVlLCBBdWcgMDEsIDIwMjMgYXQg
MTA6MTU6MTZQTSArMDgwMCwgQ2VsZXN0ZSBMaXUgd3JvdGU6Cj4gPj4gV2hlbiB3ZSB0ZXN0IHNl
Y2NvbXAgd2l0aCA2LjQga2VybmVsLCB3ZSBmb3VuZCBlcnJubyBoYXMgd3JvbmcgdmFsdWUuCj4g
Pj4gSWYgd2UgZGVueSBORVRMSU5LX0FVRElUIHdpdGggRUFGTk9TVVBQT1JULCBhZnRlciBmMGJk
ZGY1MDU4NmQsIHdlIHdpbGwKPiA+PiBnZXQgRU5PU1lTIGluc3RlYWQuIFdlIGdvdCBzYW1lIHJl
c3VsdCB3aXRoIGNvbW1pdCA5YzI1OThkNDM1MTAgKCJyaXNjdjoKPiA+PiBlbnRyeTogU2F2ZSBh
MCBwcmlvciBzeXNjYWxsX2VudGVyX2Zyb21fdXNlcl9tb2RlKCkiKS4KPiA+Pgo+ID4+IEFmdGVy
IGFuYWx5c2luZyBjb2RlLCB3ZSB0aGluayB0aGF0IHJlZ3MtPmEwID0gLUVOT1NZUyBzaG91bGQg
b25seSBiZQo+ID4+IGV4ZWN1dGVkIHdoZW4gc3lzY2FsbCAhPSAtMS4gSW4gX19zZWNjb21wX2Zp
bHRlciwgd2hlbiBzZWNjb21wIHJlamVjdGVkCj4gPj4gdGhpcyBzeXNjYWxsIHdpdGggc3BlY2lm
aWVkIGVycm5vLCB0aGV5IHdpbGwgc2V0IGEwIHRvIHJldHVybiBudW1iZXIgYXMKPiA+PiBzeXNj
YWxsIEFCSSwgYW5kIHRoZW4gcmV0dXJuIC0xLiBUaGlzIHJldHVybiBudW1iZXIgaXMgZmluYWxs
eSBwYXNzIGFzCj4gPj4gcmV0dXJuIG51bWJlciBvZiBzeXNjYWxsX2VudGVyX2Zyb21fdXNlcl9t
b2RlLCBhbmQgdGhlbiBpcyBjb21wYXJlZCB3aXRoCj4gPj4gTlJfc3lzY2FsbHMgYWZ0ZXIgY29u
dmVydGVkIHRvIHVsb25nIChzbyBpdCB3aWxsIGJlIFVMT05HX01BWCkuIFRoZQo+ID4+IGNvbmRp
dGlvbiBzeXNjYWxsIDwgTlJfc3lzY2FsbHMgd2lsbCBhbHdheXMgYmUgZmFsc2UsIHNvIHJlZ3Mt
PmEwID0gLUVOT1NZUwo+ID4+IGlzIGFsd2F5cyBleGVjdXRlZC4gSXQgY292ZXJlZCBhMCBzZXQg
Ynkgc2VjY29tcCwgc28gd2UgYWx3YXlzIGdldAo+ID4+IEVOT1NZUyB3aGVuIG1hdGNoIHNlY2Nv
bXAgUkVUX0VSUk5PIHJ1bGUuCj4gPj4KPiA+PiBGaXhlczogZjBiZGRmNTA1ODZkICgicmlzY3Y6
IGVudHJ5OiBDb252ZXJ0IHRvIGdlbmVyaWMgZW50cnkiKQo+ID4+IFJlcG9ydGVkLWJ5OiBGZWxp
eCBZYW4gPGZlbGl4b25tYXJzQGFyY2hsaW51eC5vcmc+Cj4gPj4gQ28tZGV2ZWxvcGVkLWJ5OiBS
dWl6aGUgUGFuIDxjMTQxMDI4QGdtYWlsLmNvbT4KPiA+PiBTaWduZWQtb2ZmLWJ5OiBSdWl6aGUg
UGFuIDxjMTQxMDI4QGdtYWlsLmNvbT4KPiA+PiBDby1kZXZlbG9wZWQtYnk6IFNoaXFpIFpoYW5n
IDxzaGlxaUBpc3JjLmlzY2FzLmFjLmNuPgo+ID4+IFNpZ25lZC1vZmYtYnk6IFNoaXFpIFpoYW5n
IDxzaGlxaUBpc3JjLmlzY2FzLmFjLmNuPgo+ID4+IFNpZ25lZC1vZmYtYnk6IENlbGVzdGUgTGl1
IDxDb2VsYWNhbnRodXNIZXhAZ21haWwuY29tPgo+ID4+IFRlc3RlZC1ieTogRmVsaXggWWFuIDxm
ZWxpeG9ubWFyc0BhcmNobGludXgub3JnPgo+ID4+IFRlc3RlZC1ieTogRW1pbCBSZW5uZXIgQmVy
dGhpbmcgPGVtaWwucmVubmVyLmJlcnRoaW5nQGNhbm9uaWNhbC5jb20+Cj4gPj4gUmV2aWV3ZWQt
Ynk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQHJpdm9zaW5jLmNvbT4KPiA+PiBSZXZpZXdlZC1ieTog
R3VvIFJlbiA8Z3VvcmVuQGtlcm5lbC5vcmc+Cj4gPj4gLS0tCj4gPj4KPiA+PiB2NCAtPiB2NTog
YWRkIFRlc3RlZC1ieSBFbWlsIFJlbm5lciBCZXJ0aGluZyA8ZW1pbC5yZW5uZXIuYmVydGhpbmdA
Y2Fub25pY2FsLmNvbT4KPiA+PiB2MyAtPiB2NDogdXNlIGxvbmcgaW5zdGVhZCBvZiB1bG9uZyB0
byByZWR1Y2UgdHlwZSBjYXN0IGFuZCBhdm9pZAo+ID4+ICAgICAgICAgICBpbXBsZW1lbnRhdGlv
bi1kZWZpbmVkIGJlaGF2aW9yLCBhbmQgbWFrZSB0aGUganVkZ21lbnQgb2Ygc3lzY2FsbAo+ID4+
ICAgICAgICAgICBpbnZhbGlkIG1vcmUgZXhwbGljaXQKPiA+PiB2MiAtPiB2MzogdXNlIGlmLXN0
YXRlbWVudCBpbnN0ZWFkIG9mIHNldCBkZWZhdWx0IHZhbHVlLAo+ID4+ICAgICAgICAgICBjbGFy
aWZ5IHRoZSB0eXBlIG9mIHN5c2NhbGwKPiA+PiB2MSAtPiB2MjogYWRkZWQgZXhwbGFuYXRpb24g
b24gd2h5IGFsd2F5cyBnb3QgRU5PU1lTCj4gPj4KPiA+PiAgYXJjaC9yaXNjdi9rZXJuZWwvdHJh
cHMuYyB8IDYgKysrLS0tCj4gPj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMg
ZGVsZXRpb25zKC0pCj4gPj4KPiA+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvdHJh
cHMuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMKPiA+PiBpbmRleCBmOTEwZGZjY2JmNWQy
Li43MjlmNzljOTdlMmJmIDEwMDY0NAo+ID4+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBz
LmMKPiA+PiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jCj4gPj4gQEAgLTI5Nyw3ICsy
OTcsNyBAQCBhc21saW5rYWdlIF9fdmlzaWJsZSBfX3RyYXBfc2VjdGlvbiB2b2lkIGRvX3RyYXBf
YnJlYWsoc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCj4gPj4gIGFzbWxpbmthZ2UgX192aXNpYmxlIF9f
dHJhcF9zZWN0aW9uIHZvaWQgZG9fdHJhcF9lY2FsbF91KHN0cnVjdCBwdF9yZWdzICpyZWdzKQo+
ID4+ICB7Cj4gPj4gICAgICBpZiAodXNlcl9tb2RlKHJlZ3MpKSB7Cj4gPj4gLSAgICAgICAgICAg
IHVsb25nIHN5c2NhbGwgPSByZWdzLT5hNzsKPiA+PiArICAgICAgICAgICAgbG9uZyBzeXNjYWxs
ID0gcmVncy0+YTc7Cj4gPj4KPiA+PiAgICAgICAgICAgICAgcmVncy0+ZXBjICs9IDQ7Cj4gPj4g
ICAgICAgICAgICAgIHJlZ3MtPm9yaWdfYTAgPSByZWdzLT5hMDsKPiA+PiBAQCAtMzA2LDkgKzMw
Niw5IEBAIGFzbWxpbmthZ2UgX192aXNpYmxlIF9fdHJhcF9zZWN0aW9uIHZvaWQgZG9fdHJhcF9l
Y2FsbF91KHN0cnVjdCBwdF9yZWdzICpyZWdzKQo+ID4+Cj4gPj4gICAgICAgICAgICAgIHN5c2Nh
bGwgPSBzeXNjYWxsX2VudGVyX2Zyb21fdXNlcl9tb2RlKHJlZ3MsIHN5c2NhbGwpOwo+ID4+Cj4g
Pj4gLSAgICAgICAgICAgIGlmIChzeXNjYWxsIDwgTlJfc3lzY2FsbHMpCj4gPj4gKyAgICAgICAg
ICAgIGlmIChzeXNjYWxsID49IDAgJiYgc3lzY2FsbCA8IE5SX3N5c2NhbGxzKQo+ID4+ICAgICAg
ICAgICAgICAgICAgICAgIHN5c2NhbGxfaGFuZGxlcihyZWdzLCBzeXNjYWxsKTsKPiA+PiAtICAg
ICAgICAgICAgZWxzZQo+ID4+ICsgICAgICAgICAgICBlbHNlIGlmIChzeXNjYWxsICE9IC0xKQo+
ID4+ICAgICAgICAgICAgICAgICAgICAgIHJlZ3MtPmEwID0gLUVOT1NZUzsKPiA+Pgo+ID4+ICAg
ICAgICAgICAgICBzeXNjYWxsX2V4aXRfdG9fdXNlcl9tb2RlKHJlZ3MpOwo+ID4KPiA+IFVuZm9y
dHVuYXRlbHksIHRoaXMgY2hhbmdlIGludHJvZHVjZWQgYSByZWdyZXNzaW9uOiBpdCBicm9rZSBz
dHJhY2UKPiA+IHN5c2NhbGwgdGFtcGVyaW5nIG9uIHJpc2N2LiAgV2hlbiB0aGUgdHJhY2VyIGNo
YW5nZXMgc3lzY2FsbCBudW1iZXIgdG8gLTEsCj4gPiB0aGUga2VybmVsIGZhaWxzIHRvIGluaXRp
YWxpemUgYTAgd2l0aCAtRU5PU1lTIGFuZCBzdWJzZXF1ZW50bHkgZmFpbHMgdG8KPiA+IHJldHVy
biB0aGUgZXJyb3IgY29kZSBvZiB0aGUgZmFpbGVkIHN5c2NhbGwgdG8gdXNlcnNwYWNlLgo+Cj4g
SW4gdGhlIHBhdGNoIHYyLCB3ZSBhY3R1YWxseSBkbyB0aGUgcmlnaHQgdGhpbmcuIEJ1dCBhcyBC
asO2cm4gVMO2cGVsJ3MKPiBzdWdnZXN0aW9uIGFuZCB3ZSBmb3VuZCBjYXN0IGxvbmcgdG8gdWxv
bmcgaXMgaW1wbGVtZW50YXRpb24tZGVmaW5lZAo+IGJlaGF2aW9yIGluIEMsIHNvIHdlIGNoYW5n
ZSBpdCB0byBjdXJyZW50IGZvcm0uIFNvIHJldmVydCB0aGlzIHBhdGNoIGFuZAo+IGFwcGx5IHBh
dGNoIHYyIHNob3VsZCBmaXggdGhpcyBpc3N1ZS4gUGF0Y2ggdjIgdXNlcyB0aHMgc2FtZSB3YXkg
d2l0aAo+IG90aGVyIGFyY2hpdGVjdHVyZXMuCj4KPiBbMV06IGh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL2FsbC8yMDIzMDcxODE2Mjk0MC4yMjYxMTgtMS1Db2VsYWNhbnRodXNIZXhAZ21haWwuY29t
LwoKTm90IHJldmVydGluZywgYnV0IGEgZml4IHRvIG1ha2Ugc3VyZSB0aGF0IGEwIGlzIGluaXRp
YWxpemVkIHRvIC1FTk9TWVMsIGUuZy46CgotLTg8LS0KZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yv
a2VybmVsL3RyYXBzLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jCmluZGV4IDA1YTE2YjFm
MGFlZS4uNTFlYmZkMjNlMDA3IDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5j
CisrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMKQEAgLTMxOSw2ICszMTksNyBAQCB2b2lk
IGRvX3RyYXBfZWNhbGxfdShzdHJ1Y3QgcHRfcmVncyAqcmVncykKCiAgcmVncy0+ZXBjICs9IDQ7
CiAgcmVncy0+b3JpZ19hMCA9IHJlZ3MtPmEwOworIHJlZ3MtPmEwID0gLUVOT1NZUzsKCiAgcmlz
Y3Zfdl92c3RhdGVfZGlzY2FyZChyZWdzKTsKCkBAIC0zMjgsOCArMzI5LDcgQEAgdm9pZCBkb190
cmFwX2VjYWxsX3Uoc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCgogIGlmIChzeXNjYWxsID49IDAgJiYg
c3lzY2FsbCA8IE5SX3N5c2NhbGxzKQogIHN5c2NhbGxfaGFuZGxlcihyZWdzLCBzeXNjYWxsKTsK
LSBlbHNlIGlmIChzeXNjYWxsICE9IC0xKQotIHJlZ3MtPmEwID0gLUVOT1NZUzsKKwogIC8qCiAg
KiBVbHRpbWF0ZWx5LCB0aGlzIHZhbHVlIHdpbGwgZ2V0IGxpbWl0ZWQgYnkgS1NUQUNLX09GRlNF
VF9NQVgoKSwKICAqIHNvIHRoZSBtYXhpbXVtIHN0YWNrIG9mZnNldCBpcyAxayBieXRlcyAoMTAg
Yml0cykuCi0tODwtLQoKQ2VsZXN0ZSwgZG8geW91IHdhbnQgdG8gY29vayB0aGF0IGZpeCBwcm9w
ZXJseT8KCgpCasO2cm4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
