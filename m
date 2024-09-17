Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57D5DC3601A
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Sep 2024 14:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=nYllCnogWpUjFYTgI9eWpjd+OGXAndf8KT/rtTZzve8=; b=dqfyZndSP3RpUodbWk4NlWcIfx
	0lkJbk2QQpK3l1KDm6tLNKzWNT4PuGba24TBSIbYIo0VhQUagpJy5xk6O7yiiGwMljTUCRHu+cket
	5G0kWBBBYOoytqNWARPbDlndvk2PzqDG3tkt3T5IfYYHI1tGiDbIAuXfGjjtnM6/9hfUb6hy3GePs
	tU4isBE5WrPwKD0O8XKBaiQ/DVylrAuPJBEzyrliFUObJRdbfdZbVP7YxZnb/YNvj6J9OhxeY86mB
	9YgkQhC8XokEiXSNBrlsDXDGtp4V5NxzIAXYtg0zZaLbATLUFB4akG7WIFjhBSp2pcn4RWTExiydj
	kQHPbhWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqZDn-00000006JS5-1IRV;
	Tue, 17 Sep 2024 14:30:27 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqY8U-00000006DSK-0VKv
	for linux-riscv@lists.infradead.org;
	Tue, 17 Sep 2024 13:20:55 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-42cbe624c59so36573035e9.3
        for <linux-riscv@lists.infradead.org>; Tue, 17 Sep 2024 06:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1726579252; x=1727184052; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J2dLER4hFIewaSVuZKAuDv/8Id6s8izBkR6u+XBoB78=;
        b=sOiLKY0aT9ivDTE0ZU4AoQepBOH6u9aR6w0tsYM8KgcFRcd/m3ZL7g92Mz2Oefmx1s
         f2I+me/nWaBl3ZP9KhVNCHwEOt+MzX9zGSl0Q1jGgiXNkXm4R65Xw3ojWxO7175Gt4bb
         UvzDfv6WPyKcbiB+C6aRlgNV3UIB0JV6b4lTiUk8N9mqe0kLXeWqX9dt0JMlQZPC7zy8
         Cp8uhbrs0T1aLL7ntJ0qSsvJWz78sEoNP8igg8mH3saDXDJCHkq7VgxQfB/QQWoRqcPc
         Ii6QVpaHev1mtYqKLEPV6NNUQrP3rnsmx5PgWP/z2dKUyty/szr3ISW3sdiaHw5wTJOz
         YjdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726579252; x=1727184052;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J2dLER4hFIewaSVuZKAuDv/8Id6s8izBkR6u+XBoB78=;
        b=Ie5qykRlqrKWT5rh5R+qReVRqPK2A+WXRfKZHK+4BgSiu8btG5Gvghc+eB49/2cfs1
         chZA3/TVUx/mZ0KLTqGCe7604ljoSeJXBBVRJ3+2uV/LjgYOgMohPjgKZmpqgq1BILdr
         x0DTMHF262GAG0slv6e5be7onh01m7jOGqe7ICm2r/tFIeWoMq1BzpnC6ALDOGUwEAzU
         mYyNB2s2ks2bB92L3SFbhjidzjAtDAc8BhG25GwC/W6YMmSqA+kMEnPRhVgfJSK8f5LV
         b5Ccc5T6mJmzXyH3LgokMtzh0eeWJUq6qqtTaRc8LMDYFnKg0SElmDQmANUboiML+/lg
         324A==
X-Forwarded-Encrypted: i=1; AJvYcCURmprthyC5D05Y2CkiWjtmETba4OXSofHYLPOUI6+Gy49HJcZ/jnW9yWfkGeAwH13MS7S1pjMXiUxcuA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzSCnjjKzN4EWAMUAA1CVGgBzKGhRFdHa3mlKCoIMA8zc/br/Dt
	0xgeaaP3neCHhfxWV2xxmG8LDf4g4QglGfllYJvy82hhwYmZGGszubBJLmKBwtM=
X-Google-Smtp-Source: AGHT+IEkJo5p9GCz0LoYuqEsugBea6QpohVZTav3exdRbgQ8e5OLK2ugx0SXZ25Eyd1uMg7S70RlkA==
X-Received: by 2002:a05:600c:510a:b0:42c:b58d:98ad with SMTP id 5b1f17b1804b1-42d9081b3a2mr101242645e9.14.1726579251797;
        Tue, 17 Sep 2024 06:20:51 -0700 (PDT)
Received: from localhost ([213.208.157.38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42da22d8b22sm102624115e9.12.2024.09.17.06.20.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Sep 2024 06:20:51 -0700 (PDT)
Date: Tue, 17 Sep 2024 06:20:51 -0700 (PDT)
X-Google-Original-Date: Tue, 17 Sep 2024 06:20:20 PDT (-0700)
Subject: Re: [PATCH/RFC] riscv: defconfig: Disable RZ/Five peripheral support
In-Reply-To: <CA+V-a8tKdwvDxYqxyf9JwDa4ZPz41=+ecJ5cf7ZO-G_PAk26-Q@mail.gmail.com>
CC: geert+renesas@glider.be, Paul Walmsley <paul.walmsley@sifive.com>,
  aou@eecs.berkeley.edu, prabhakar.mahadev-lad.rj@bp.renesas.com,
  Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
  linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: prabhakar.csengg@gmail.com
Message-ID: <mhng-b838be82-513e-4403-8746-d6db428bbb1f@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240917_062054_189171_BB5BB7E9 
X-CRM114-Status: GOOD (  22.77  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVGh1LCAwMSBBdWcgMjAyNCAwMDozMjo0MyBQRFQgKC0wNzAwKSwgcHJhYmhha2FyLmNzZW5n
Z0BnbWFpbC5jb20gd3JvdGU6Cj4gSGkgR2VlcnQsCj4KPiBPbiBUdWUsIEp1bCAzMCwgMjAyNCBh
dCA0OjM34oCvUE0gR2VlcnQgVXl0dGVyaG9ldmVuCj4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJl
PiB3cm90ZToKPj4KPj4gVGhlcmUgaXMgbm90IG11Y2ggcG9pbnQgaW4ga2VlcGluZyBzdXBwb3J0
IGZvciBSWi9GaXZlIHBlcmlwaGVyYWxzCj4+IGVuYWJsZWQsIGFzIHRoZSBSWi9GaXZlIHBsYXRm
b3JtIG9wdGlvbiAoQVJDSF9SOUEwN0cwNDMpIGlzIGdhdGVkIGJlaGluZAo+PiBOT05QT1JUQUJM
RS4gIEhlbmNlIGRyb3AgYWxsIGNvbmZpZyBvcHRpb25zIHRoYXQgZW5hYmxlIGJ1aWx0LWluIG9y
Cj4+IG1vZHVsYXIgc3VwcG9ydCBmb3IgcGVyaXBoZXJhbHMgZm91bmQgb24gUlovRml2ZSBTb0Nz
Lgo+Pgo+PiBEaXNhYmxlIFVTQl9YSENJX1JDQVIgZXhwbGljaXRseSwgYXMgaXRzIHZhbHVlIGRl
ZmF1bHRzIHRvIHRoZSB2YWx1ZSBvZgo+PiBBUkNIX1JFTkVTQVMsIHdoaWNoIGlzIHN0aWxsIGVu
YWJsZWQuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVu
ZXNhc0BnbGlkZXIuYmU+Cj4+IC0tLQo+PiBRdWVzdGlvbnM6Cj4+ICAgMS4gUGVyaGFwcyB0aGUg
aW50ZW50aW9uIGlzIHRvIGtlZXAgYWxsIFJaL0ZpdmUgcGVyaXBoZXJhbCBzdXBwb3J0Cj4+ICAg
ICAgZW5hYmxlZCwgc28gUlovRml2ZSB1c2VycyBjYW4gc3RhcnQgZnJvbSB0aGUgZGVmY29uZmln
LCBhbmQKPj4gICAgICAianVzdCJbMV0gZW5hYmxlIE5PTlBPUlRBQkxFIGFuZCBBUkNIX1I5QTA3
RzA0Mz8KPj4KPj4gICAgICBbMV0gTm9wZSwgbmVlZCB0byBkaXNhYmxlIFJJU0NWX0lTQV9aSUNC
T00gYW5kIEVSUkFUQV9USEVBRF9DTU8KPj4gICAgICAgICAgKGFuZCB3aGF0ZXZlciBlbHNlIGlu
IHRoZSBmdXR1cmU/KSwgdG9vLgo+Pgo+PiAgIDIuIFBlcmhhcHMgQ09ORklHX0FSQ0hfUkVORVNB
Uz15IHNob3VsZCBiZSBkcm9wcGVkLCB0b28/Cj4+ICAgICAgSW4gYWRkaXRpb24gdG8gVVNCX1hI
Q0lfUkNBUiwgdGhhdCB3b3VsZCBnZXQgcmlkIG9mIFNPQ19CVVMsCj4+ICAgICAgUElOQ1RSTF9S
RU5FU0FTLCBDTEtfUkVORVNBUywgYW5kIFNPQ19SRU5FU0FTLgo+Pgo+IEkgdGhpbmsgaXQgZG9l
cyBtYWtlIHNlbnNlIGlmIHdlIGRyb3AgdGhlIGFib3ZlIGNvbmZpZ3MgdG9vIGFzIGFueXdheQo+
IHVzZXJzIHdpbGwgaGF2ZSB0byBzZWxlY3QgdGhlIGNvbmZpZ3MgbWFudWFsbHkgdG8gZ2V0IGEg
Ym9vdGFibGUgaW1hZ2UKPiBmb3IgUlovRml2ZS4KCllhLCBJIGFncmVlLiAgSWYgd2UgZW5kIHVw
IHdpdGggYW5vdGhlciBSWi9GaXZlIG9yIHNvbW9uZSBnZXRzIHJpZCBvZiAKdGhhdCBETUEgcG9v
bCBzdHVmZiB0aGF0J3MgZm9yY2luZyB0aGUgTk9OUE9SVEFCTEUgdGhlbiB3ZSBjYW4gYWx3YXlz
IApyZS1hZGQgaXQuCgpJIHBpY2tlZCB0aGlzIG9uZSB1cCBhbmQgc2VuZCB0aGUgQVJDSF9SRU5F
U0FTIHJlbW92YWwuCgo+Cj4+IC0tLQo+PiAgYXJjaC9yaXNjdi9jb25maWdzL2RlZmNvbmZpZyB8
IDEyICstLS0tLS0tLS0tLQo+PiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxMSBk
ZWxldGlvbnMoLSkKPj4KPiBSZXZpZXdlZC1ieTogTGFkIFByYWJoYWthciA8cHJhYmhha2FyLm1h
aGFkZXYtbGFkLnJqQGJwLnJlbmVzYXMuY29tPgo+Cj4gQ2hlZXJzLAo+IFByYWJoYWthcgo+Cj4+
IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2NvbmZpZ3MvZGVmY29uZmlnIGIvYXJjaC9yaXNjdi9j
b25maWdzL2RlZmNvbmZpZwo+PiBpbmRleCAwZDY3ODMyNTQ0NGZjY2RjLi5iNTFlZjZjZDFlMzk4
NmVkIDEwMDY0NAo+PiAtLS0gYS9hcmNoL3Jpc2N2L2NvbmZpZ3MvZGVmY29uZmlnCj4+ICsrKyBi
L2FyY2gvcmlzY3YvY29uZmlncy9kZWZjb25maWcKPj4gQEAgLTEzNywxMiArMTM3LDEwIEBAIENP
TkZJR19WSVJUSU9fTkVUPXkKPj4gIENPTkZJR19NQUNCPXkKPj4gIENPTkZJR19FMTAwMEU9eQo+
PiAgQ09ORklHX1I4MTY5PXkKPj4gLUNPTkZJR19SQVZCPXkKPj4gIENPTkZJR19TVE1NQUNfRVRI
PW0KPj4gIENPTkZJR19NSUNSRUxfUEhZPXkKPj4gIENPTkZJR19NSUNST1NFTUlfUEhZPXkKPj4g
IENPTkZJR19NT1RPUkNPTU1fUEhZPXkKPj4gLUNPTkZJR19DQU5fUkNBUl9DQU5GRD1tCj4+ICBD
T05GSUdfSU5QVVRfTU9VU0VERVY9eQo+PiAgQ09ORklHX0tFWUJPQVJEX1NVTjRJX0xSQURDPW0K
Pj4gIENPTkZJR19TRVJJQUxfODI1MD15Cj4+IEBAIC0xNTAsNyArMTQ4LDYgQEAgQ09ORklHX1NF
UklBTF84MjUwX0NPTlNPTEU9eQo+PiAgQ09ORklHX1NFUklBTF84MjUwX0RXPXkKPj4gIENPTkZJ
R19TRVJJQUxfT0ZfUExBVEZPUk09eQo+PiAgQ09ORklHX1NFUklBTF9FQVJMWUNPTl9SSVNDVl9T
Qkk9eQo+PiAtQ09ORklHX1NFUklBTF9TSF9TQ0k9eQo+PiAgQ09ORklHX1ZJUlRJT19DT05TT0xF
PXkKPj4gIENPTkZJR19IV19SQU5ET009eQo+PiAgQ09ORklHX0hXX1JBTkRPTV9WSVJUSU89eQo+
PiBAQCAtMTU5LDExICsxNTYsOSBAQCBDT05GSUdfSTJDPXkKPj4gIENPTkZJR19JMkNfQ0hBUkRF
Vj1tCj4+ICBDT05GSUdfSTJDX0RFU0lHTldBUkVfUExBVEZPUk09eQo+PiAgQ09ORklHX0kyQ19N
VjY0WFhYPW0KPj4gLUNPTkZJR19JMkNfUklJQz15Cj4+ICBDT05GSUdfU1BJPXkKPj4gIENPTkZJ
R19TUElfQ0FERU5DRV9RVUFEU1BJPW0KPj4gIENPTkZJR19TUElfUEwwMjI9bQo+PiAtQ09ORklH
X1NQSV9SU1BJPW0KPj4gIENPTkZJR19TUElfU0lGSVZFPXkKPj4gIENPTkZJR19TUElfU1VONkk9
eQo+PiAgIyBDT05GSUdfUFRQXzE1ODhfQ0xPQ0sgaXMgbm90IHNldAo+PiBAQCAtMTcyLDcgKzE2
Nyw2IEBAIENPTkZJR19QT1dFUl9SRVNFVF9HUElPX1JFU1RBUlQ9eQo+PiAgQ09ORklHX1NFTlNP
UlNfU0ZDVEVNUD1tCj4+ICBDT05GSUdfQ1BVX1RIRVJNQUw9eQo+PiAgQ09ORklHX0RFVkZSRVFf
VEhFUk1BTD15Cj4+IC1DT05GSUdfUlpHMkxfVEhFUk1BTD15Cj4+ICBDT05GSUdfV0FUQ0hET0c9
eQo+PiAgQ09ORklHX1NVTlhJX1dBVENIRE9HPXkKPj4gIENPTkZJR19NRkRfQVhQMjBYX0kyQz15
Cj4+IEBAIC0yMDEsMTEgKzE5NSwxMSBAQCBDT05GSUdfVVNCPXkKPj4gIENPTkZJR19VU0JfT1RH
PXkKPj4gIENPTkZJR19VU0JfWEhDSV9IQ0Q9eQo+PiAgQ09ORklHX1VTQl9YSENJX1BMQVRGT1JN
PXkKPj4gKyMgQ09ORklHX1VTQl9YSENJX1JDQVIgaXMgbm90IHNldAo+PiAgQ09ORklHX1VTQl9F
SENJX0hDRD15Cj4+ICBDT05GSUdfVVNCX0VIQ0lfSENEX1BMQVRGT1JNPXkKPj4gIENPTkZJR19V
U0JfT0hDSV9IQ0Q9eQo+PiAgQ09ORklHX1VTQl9PSENJX0hDRF9QTEFURk9STT15Cj4+IC1DT05G
SUdfVVNCX1JFTkVTQVNfVVNCSFM9bQo+PiAgQ09ORklHX1VTQl9TVE9SQUdFPXkKPj4gIENPTkZJ
R19VU0JfVUFTPXkKPj4gIENPTkZJR19VU0JfQ0ROU19TVVBQT1JUPW0KPj4gQEAgLTIxNyw3ICsy
MTEsNiBAQCBDT05GSUdfVVNCX01VU0JfSERSQz1tCj4+ICBDT05GSUdfVVNCX01VU0JfU1VOWEk9
bQo+PiAgQ09ORklHX05PUF9VU0JfWENFSVY9bQo+PiAgQ09ORklHX1VTQl9HQURHRVQ9eQo+PiAt
Q09ORklHX1VTQl9SRU5FU0FTX1VTQkhTX1VEQz1tCj4+ICBDT05GSUdfVVNCX0NPTkZJR0ZTPW0K
Pj4gIENPTkZJR19VU0JfQ09ORklHRlNfU0VSSUFMPXkKPj4gIENPTkZJR19VU0JfQ09ORklHRlNf
QUNNPXkKPj4gQEAgLTIzNSw3ICsyMjgsNiBAQCBDT05GSUdfTU1DX1NESENJX1BMVEZNPXkKPj4g
IENPTkZJR19NTUNfU0RIQ0lfT0ZfRFdDTVNIQz15Cj4+ICBDT05GSUdfTU1DX1NESENJX0NBREVO
Q0U9eQo+PiAgQ09ORklHX01NQ19TUEk9eQo+PiAtQ09ORklHX01NQ19TREhJPXkKPj4gIENPTkZJ
R19NTUNfRFc9eQo+PiAgQ09ORklHX01NQ19EV19TVEFSRklWRT15Cj4+ICBDT05GSUdfTU1DX1NV
TlhJPXkKPj4gQEAgLTI1MCw3ICsyNDIsNiBAQCBDT05GSUdfVklSVElPX0lOUFVUPXkKPj4gIENP
TkZJR19WSVJUSU9fTU1JTz15Cj4+ICBDT05GSUdfQ0xLX1NPUEhHT19DVjE4MDA9eQo+PiAgQ09O
RklHX1NVTjhJX0RFMl9DQ1U9bQo+PiAtQ09ORklHX1JFTkVTQVNfT1NUTT15Cj4+ICBDT05GSUdf
U1VONTBJX0lPTU1VPXkKPj4gIENPTkZJR19SUE1TR19DSEFSPXkKPj4gIENPTkZJR19SUE1TR19D
VFJMPXkKPj4gQEAgLTI1OCw3ICsyNDksNiBAQCBDT05GSUdfUlBNU0dfVklSVElPPXkKPj4gIENP
TkZJR19QTV9ERVZGUkVRPXkKPj4gIENPTkZJR19JSU89eQo+PiAgQ09ORklHX1BIWV9TVU40SV9V
U0I9bQo+PiAtQ09ORklHX1BIWV9SQ0FSX0dFTjNfVVNCMj15Cj4+ICBDT05GSUdfUEhZX1NUQVJG
SVZFX0pINzExMF9EUEhZX1JYPW0KPj4gIENPTkZJR19QSFlfU1RBUkZJVkVfSkg3MTEwX1BDSUU9
bQo+PiAgQ09ORklHX1BIWV9TVEFSRklWRV9KSDcxMTBfVVNCPW0KPj4gLS0KPj4gMi4zNC4xCj4+
Cj4+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
