Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85DE0C6FD18
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Apr 2023 15:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=QuAXcDmfz6/+iEtPuTyg+nu/wBUoqIj8yr3XXo51sWE=; b=rtg6qgpWq+FGX8UaW1xgYSw+X9
	pxXBUmU9q847d2AV2xgUDH/uKF0cppVJzA8NXqBS4+JWp9Nk7kQe2w5q6Uaom/HWO1yAmuu6ztLJm
	PL3faoPYIqCyclN8MWYhjO6s4mhaZunROf8lYNi5v+inh5MfKw2XeXdqx+WzIWcpK7h0hPRcKmJFN
	VY6PjXRs1AX5oGnQC+pJLBoW0i+LQ4HD8BvHPP6Fp0Ds3eLXlNfHy2TTW4sduqkJmJoXoezDiVoc5
	m8NWrcLV/bXpDWFWM+NHizWk3+yUG4YmSA3J+Y0QoXiLwxluq2e+77OruNEzma/hEqxsgJdEOgUMb
	DFVA5+Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pp9Zy-005lSs-0k;
	Wed, 19 Apr 2023 15:18:42 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pp9Zu-005lRP-1L
	for linux-riscv@lists.infradead.org;
	Wed, 19 Apr 2023 15:18:40 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-63d4595d60fso91429b3a.0
        for <linux-riscv@lists.infradead.org>; Wed, 19 Apr 2023 08:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1681917515; x=1684509515;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EXO4Ni/kSG0H+ktMq4uVlmS1jzHn6kSPNbg8TaaS/64=;
        b=I4jQQN9eouwrtidT/DUB5WkdlKm7L9khwPMcUJauiyf8rJBlAame3Q6t26oPRiuSir
         V3NyYYQfjijqMtyz4ev2S1hLM+LwD+YrOUp2rTORUxgdnYFZWTCnXzqi0qurWwdWpAJX
         ferp2EQ10dVH3l6PH+pe0zSyJusaWqAVsodVenXc7KIql+/i8ytrAGSr+57wYwsRlH/k
         J627seCPgxf2b+o7lKaElPnIF/3SZHvf0nQbzYndGZeaNYzcTo0aiJj+u9mxtoxu0QF1
         YXmqCEBnVVBulUo18BOb3Uflq2ruhl3mE8lgHWtUtv48MIffji2W9NZh4wDSryamlC3T
         5CLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681917515; x=1684509515;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EXO4Ni/kSG0H+ktMq4uVlmS1jzHn6kSPNbg8TaaS/64=;
        b=TIrc5dmjEhQwRRqQ+8ycCayuFy996u5OXU9+eoC/aHMUhVUQxQNmLOzffSlxEppM35
         lsN99dqIaVrrUk4KKKYHAcfomDNw1LWI8sSppzB+NQD2WhvxAjEgfaToHQTyA6k9PCwG
         cGVKF+DqTfq+PYqSLdb0joX3PUC11dFNqF2CtTTDCeA+WI6gv7NxveDz4ec9oO8cO0XI
         loViHue5gQ8i0V4eZUEYcclECYamX2SA/DoaE4sMfr+vp04fPBKYnvTCYvhx89AQpOaU
         hm5N1Cr+xb61ovNM13Teeofokit/jZYv0oSvEhNJw/wS8qiPWJWGyg91c+Lt39vII7xB
         GEYg==
X-Gm-Message-State: AAQBX9f/zptaEzYJ+9t7XbZNlQIPkXgBUkic4xF8AyXmRmDPYVTsQIIe
	f4lCqQs+e/6RbMbphENfWCt8QRMuGPTMzwXhZyckCw==
X-Google-Smtp-Source: AKy350bZnV7c2T9bRz1wthVAe/bP3QzgvRgK4ReNB5NaaqF8YhlO6cXRmlyQ+YeTPBpXOFLIQygKdQ==
X-Received: by 2002:a17:902:e742:b0:1a1:a727:a802 with SMTP id p2-20020a170902e74200b001a1a727a802mr3393492plf.19.1681917514986;
        Wed, 19 Apr 2023 08:18:34 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id o4-20020a655bc4000000b0051b9e82d6d6sm6299141pgr.40.2023.04.19.08.18.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 08:18:34 -0700 (PDT)
Date: Wed, 19 Apr 2023 08:18:34 -0700 (PDT)
X-Google-Original-Date: Wed, 19 Apr 2023 08:17:54 PDT (-0700)
Subject: Re: [PATCH -next v18 00/20] riscv: Add vector ISA support
In-Reply-To: <87leinq5wg.fsf@all.your.base.are.belong.to.us>
CC: andy.chiu@sifive.com, linux-riscv@lists.infradead.org, anup@brainfault.org,
  atishp@atishpatra.org, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
  Vineet Gupta <vineetg@rivosinc.com>, greentime.hu@sifive.com, guoren@linux.alibaba.com, andy.chiu@sifive.com,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, nathan@kernel.org, ndesaulniers@google.com,
  trix@redhat.com, Richard Henderson <richard.henderson@linaro.org>, libc-alpha@sourceware.org,
  Andrew Waterman <andrew@sifive.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: bjorn@kernel.org
Message-ID: <mhng-607b5023-8f07-4a82-b292-35078123e9e8@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_081838_453030_2BB9C3CC 
X-CRM114-Status: GOOD (  27.96  )
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

T24gV2VkLCAxOSBBcHIgMjAyMyAwNzo1NDoyMyBQRFQgKC0wNzAwKSwgYmpvcm5Aa2VybmVsLm9y
ZyB3cm90ZToKPiBCasO2cm4gVMO2cGVsIDxiam9ybkBrZXJuZWwub3JnPiB3cml0ZXM6Cj4KPj4g
QW5keSBDaGl1IDxhbmR5LmNoaXVAc2lmaXZlLmNvbT4gd3JpdGVzOgo+Pgo+Pj4gVGhpcyBwYXRj
aHNldCBpcyBpbXBsZW1lbnRlZCBiYXNlZCBvbiB2ZWN0b3IgMS4wIHNwZWMgdG8gYWRkIHZlY3Rv
ciBzdXBwb3J0Cj4+PiBpbiByaXNjdiBMaW51eCBrZXJuZWwuIFRoZXJlIGFyZSBzb21lIGFzc3Vt
cHRpb25zIGZvciB0aGlzIGltcGxlbWVudGF0aW9ucy4KPj4+Cj4+PiAxLiBXZSBhc3N1bWUgYWxs
IGhhcnRzIGhhcyB0aGUgc2FtZSBJU0EgaW4gdGhlIHN5c3RlbS4KPj4+IDIuIFdlIGRpc2FibGUg
dmVjdG9yIGluIGJvdGgga2VybmVsIGFuZCB1c2VyIHNwYWNlIFsxXSBieSBkZWZhdWx0LiBPbmx5
Cj4+PiAgICBlbmFibGUgYW4gdXNlcidzIHZlY3RvciBhZnRlciBhbiBpbGxlZ2FsIGluc3RydWN0
aW9uIHRyYXAgd2hlcmUgaXQKPj4+ICAgIGFjdHVhbGx5IHN0YXJ0cyBleGVjdXRpbmcgdmVjdG9y
ICh0aGUgZmlyc3QtdXNlIHRyYXAgWzJdKS4KPj4+IDMuIFdlIGRldGVjdCAicmlzY3YsaXNhIiB0
byBkZXRlcm1pbmUgd2hldGhlciB2ZWN0b3IgaXMgc3VwcG9ydCBvciBub3QuCj4+Pgo+Pj4gV2Ug
ZGVmaW5lZCBhIG5ldyBzdHJ1Y3R1cmUgX19yaXNjdl92X2V4dF9zdGF0ZSBpbiBzdHJ1Y3QgdGhy
ZWFkX3N0cnVjdCB0bwo+Pj4gc2F2ZS9yZXN0b3JlIHRoZSB2ZWN0b3IgcmVsYXRlZCByZWdpc3Rl
cnMuIEl0IGlzIHVzZWQgZm9yIGJvdGgga2VybmVsIHNwYWNlCj4+PiBhbmQgdXNlciBzcGFjZS4K
Pj4+ICAtIEluIGtlcm5lbCBzcGFjZSwgdGhlIGRhdGFwIHBvaW50ZXIgaW4gX19yaXNjdl92X2V4
dF9zdGF0ZSB3aWxsIGJlCj4+PiAgICBhbGxvY2F0ZWQgdG8gc2F2ZSB2ZWN0b3IgcmVnaXN0ZXJz
Lgo+Pj4gIC0gSW4gdXNlciBzcGFjZSwKPj4+IAktIEluIHNpZ25hbCBoYW5kbGVyIG9mIHVzZXIg
c3BhY2UsIHRoZSBzdHJ1Y3R1cmUgaXMgcGxhY2VkCj4+PiAJICByaWdodCBhZnRlciBfX3Jpc2N2
X2N0eF9oZHIsIHdoaWNoIGlzIGVtYmVkZGVkIGluIGZwIHJlc2VydmVkCj4+PiAJICBhZXJhLiBU
aGlzIGlzIHJlcXVpcmVkIHRvIGF2b2lkIEFCSSBicmVhayBbMl0uIEFuZCBkYXRhcCBwb2ludHMK
Pj4+IAkgIHRvIHRoZSBlbmQgb2YgX19yaXNjdl92X2V4dF9zdGF0ZS4KPj4+IAktIEluIHB0cmFj
ZSwgdGhlIGRhdGEgd2lsbCBiZSBwdXQgaW4gdWJ1ZiBpbiB3aGljaCB3ZSB1c2UKPj4+IAkgIHJp
c2N2X3ZyX2dldCgpL3Jpc2N2X3ZyX3NldCgpIHRvIGdldCBvciBzZXQgdGhlCj4+PiAJICBfX3Jp
c2N2X3ZfZXh0X3N0YXRlIGRhdGEgc3RydWN0dXJlIGZyb20vdG8gaXQsIGRhdGFwIHBvaW50ZXIK
Pj4+IAkgIHdvdWxkIGJlIHplcm9lZCBhbmQgdmVjdG9yIHJlZ2lzdGVycyB3aWxsIGJlIGNvcGll
ZCB0byB0aGUKPj4+IAkgIGFkZHJlc3MgcmlnaHQgYWZ0ZXIgdGhlIF9fcmlzY3Zfdl9leHRfc3Rh
dGUgc3RydWN0dXJlIGluIHVidWYuCj4+Pgo+Pj4gVGhpcyBwYXRjaHNldCBpcyByZWJhc2VkIHRv
IHY2LjMtcmMxIGFuZCBpdCBpcyB0ZXN0ZWQgYnkgcnVubmluZyBzZXZlcmFsCj4+PiB2ZWN0b3Ig
cHJvZ3JhbXMgc2ltdWx0YW5lb3VzbHkuIEl0IGRlbGl2ZXJzIHNpZ25hbHMgY29ycmVjdGx5IGlu
IGEgdGVzdAo+Pj4gd2hlcmUgd2UgY2FuIHNlZSBhIHZhbGlkIHVjb250ZXh0X3QgaW4gYSBzaWdu
YWwgaGFuZGxlciwgYW5kIGEgY29ycmVjdCBWCj4+PiBjb250ZXh0IHJldHVyaW5nIGJhY2sgZnJv
bSBpdC4gQW5kIHRoZSBwdHJhY2UgaW50ZXJmYWNlIGlzIHRlc3RlZCBieQo+Pj4gUFRSQUNFX3tH
RVQsU0VUfVJFR1NFVC4gTGFzdGx5LCBLVk0gaXMgdGVzdGVkIGJ5IHJ1bm5pbmcgYWJvdmUgdGVz
dHMgaW4KPj4+IGEgZ3Vlc3QgdXNpbmcgdGhlIHNhbWUga2VybmVsIGltYWdlLiBBbGwgdGVzdHMg
YXJlIGRvbmUgb24gYW4gcnY2NGdjdgo+Pj4gdmlydCBRRU1VLgo+Pj4KPj4+IE5vdGU6IHBsZWFz
ZSBhcHBseSB0aGUgcGF0Y2ggYXQgWzRdIGR1ZSB0byBhIHJlZ3Jlc3Npb24gaW50cm9kdWNlZCBi
eQo+Pj4gY29tbWl0IDU5NmZmNGEwOWI4OSAoImNwdW1hc2s6IHJlLWludHJvZHVjZSBjb25zdGFu
dC1zaXplZCBjcHVtYXNrCj4+PiBvcHRpbWl6YXRpb25zIikgYmVmb3JlIHRlc3RpbmcgdGhlIHNl
cmllcy4KPj4+Cj4+PiBTb3VyY2UgdHJlZToKPj4+IGh0dHBzOi8vZ2l0aHViLmNvbS9zaWZpdmUv
cmlzY3YtbGludXgvdHJlZS9yaXNjdi9mb3ItbmV4dC92ZWN0b3ItdjE4Cj4+Cj4+IEFmdGVyIHNv
bWUgb2ZmbGlzdCBkaXNjdXNzaW9ucywgd2UgbWlnaHQgaGF2ZSBhIGlkZW50aWZpZWQgYQo+PiBw
b3RlbnRpYWwgbGliYy0+YXBwbGljYXRpb24gQUJJIGJyZWFrLgo+Pgo+PiBHaXZlbiBhbiBhcHBs
aWNhdGlvbiB0aGF0IGRvZXMgY3VzdG9tIHRhc2sgc2NoZWR1bGluZyB2aWEgYSBzaWduYWwKPj4g
aGFuZGxlci4gVGhlIGFwcGxpY2F0aW9uIGJpbmFyeSBpcyBub3QgdmVjdG9yIGF3YXJlLCBidXQg
bGliYyBpcy4gTGliYwo+PiBpcyB1c2luZyB2ZWN0b3IgcmVnaXN0ZXJzIGZvciBtZW1jcHkuIEl0
J3MgYW4gIm9sZCBhcHBsaWNhdGlvbiwgbmV3Cj4+IGxpYnJhcnksIG5ldyBrZXJuZWwiLXNjZW5h
cmlvLgo+Pgo+PiAgfCAuLi4KPj4gIHwgc3RydWN0IGNvbnRleHQgKnAxX2N0eDsKPj4gIHwgc3Ry
dWN0IGNvbnRleHQgKnAyX2N0eDsKPj4gIHwgCj4+ICB8IHZvaWQgc2lnaGFuZGxlcihpbnQgc2ln
LCBzaWdpbmZvX3QgKmluZm8sIHZvaWQgKnVjb250ZXh0KQo+PiAgfCB7Cj4+ICB8ICAgaWYgKHAx
X3J1bm5pbmcpCj4+ICB8ICAgICBzd2l0Y2hfdG8ocDFfY3R4LCBwMl9jdHgpOwo+PiAgfCAgIGlm
IChwMl9ydW5uaW5nKQo+PiAgfCAgICAgc3dpdGNoX3RvKHAyX2N0eCwgcDFfY3R4KTsKPj4gIHwg
fQo+PiAgfCAKPj4gIHwgdm9pZCBwMSh2b2lkKQo+PiAgfCB7Cj4+ICB8ICAgbWVtY3B5KGZvbywg
YmFyLCAxNyk7Cj4+ICB8IH0KPj4gIHwgCj4+ICB8IHZvaWQgcDIodm9pZCkKPj4gIHwgewo+PiAg
fCAgIC4uLgo+PiAgfCB9Cj4+ICB8IC4uLgo+Pgo+PiBUaGUgc3dpdGNoX3RvKCkgZnVuY3Rpb24g
c2NoZWR1bGVzIHAxKCkgYW5kIHAyKCkuIEUuZy4sIHRoZQo+PiBhcHBsaWNhdGlvbiAoYXNzdW1l
cyB0aGF0IGl0KSBzYXZlcyB0aGUgY29tcGxldGUgdGFzayBzdGF0ZSBmcm9tCj4+IHNpZ2NvbnRl
eHQgKHVjb250ZXh0KSB0byBwMV9jdHgsIGFuZCByZXN0b3JlcyBzaWdjb250ZXh0IHRvIHAyX2N0
eCwgc28KPj4gd2hlbiBzaWdyZXR1cm4gaXMgY2FsbGVkLCBwMigpIGlzIHJ1bm5pbmcsIGFuZCBw
MSgpIGhhcyBiZWVuCj4+IGludGVycnVwdGVkLgo+Pgo+PiBUaGUgIm9sZCBhcHBsaWNhdGlvbiIg
d2hpY2ggaXMgbm90IGF3YXJlIG9mIHZlY3RvciwgaXMgbm93IHJ1biBvbiBhCj4+IHZlY3RvciBl
bmFibGVkIGtlcm5lbC9nbGliYy4KPj4KPj4gQXNzdW1lIHRoYXQgdGhlIHNpZ2hhbmRsZXIgaXMg
aGl0LCBhbmQgcDEoKSBpcyBpbiB0aGUgbWlkZGxlIG9mIHRoZQo+PiB2ZWN0b3IgbWVtY3B5LiBU
aGUgc3dpdGNoX3RvKCkgZnVuY3Rpb24gd2lsbCBub3Qgc2F2ZSB0aGUgdmVjdG9yCj4+IHN0YXRl
LCBhbmQgbmV4dCB0aW1lIHAyKCkgaXMgc2NoZWR1bGVkIHRvIHJ1biBpdCB3aWxsIGhhdmUgaW5j
b3JyZWN0Cj4+IG1hY2hpbmUgc3RhdGUuCgpUaGFua3MgZm9yIHdyaXRpbmcgdGhpcyB1cCwgYW5k
IHNvcnJ5IEkndmUgZHJvcHBlZCB0aGUgYmFsbCBhIGZldyB0aW1lcyBvbgpkZXNjcmliaW5nIGl0
LgoKPj4gTm93Ogo+Pgo+PiBJcyB0aGlzIGFuIGFjdHVhbCBvciB0aGVvcmV0aWNhbCBwcm9ibGVt
IChpLmUuIGFyZSB0aGVyZSBhbnkKPj4gYXBwbGljYXRpb25zIGluIHRoZSB3aWxkKT8gSSdkIGJl
IHN1cnByaXNlZCBpZiBpdCB3b3VsZCBub3QgYmUgdGhlCj4+IGxhdHRlci4uLgoKSSBhbHNvIGhh
dmUgbm8gaWRlYS4gIEl0J3Mga2luZCBvZiBvZGQgdG8gc2F5ICJub2JvZHkgY2FyZXMgYWJvdXQg
dGhlIApBQkkgYnJlYWsiIHdoZW4gd2UgY2FuIG1hbmlmZXN0IGl0IHdpdGggc29tZSBmYWlybHkg
c2ltcGxlIGV4YW1wbGUsIGJ1dCAKSSdkIGJldCB0aGF0IG5vYm9keSBjYXJlcy4KCj4+IFJlZ2Fy
ZGxlc3MsIGEga2VybmVsIGtub2IgZm9yIGRpc2FibGluZyB2ZWN0b3IgKHN5c2N0bC9wcmN0bCkg
dG8gYXZvaWQKPj4gdGhlc2Uga2luZCBvZiBicmVha3MgaXMgbmVlZGVkIChyaWdodD8pLiBDb3Vs
ZCB0aGlzIGtub2IgYmUgYQo+PiBmb2xsb3ctdXAgcGF0Y2ggdG8gdGhlIGV4aXN0aW5nIHYxOCBz
ZXJpZXM/Cj4+Cj4+IE5vdGUgdGhhdCBhcm02NCBkb2VzIG5vdCBzdWZmZXIgZnJvbSB0aGlzIHdp
dGggU1ZFLCBiZWNhdXNlIHRoZSBkZWZhdWx0Cj4+IHZlY3RvciBsZW5ndGggKHZsPT0wLzEyOGIq
MzIpIGZpdHMgaW4gdGhlICJsZWdhY3kiIHNpZ2NvbnRleHQuCj4KPiBBbmR5LCB0byBjbGFyaWZ5
IGZyb20gdGhlIHBhdGNod29yayBjYWxsOyBJbgo+IERvY3VtZW50YXRpb24vYXJtNjQvc3ZlLnJz
dDoKPgo+IFRoZXJlJ3MgYSBwZXItcHJvY2VzcyBwcmN0bCAoc2VjdGlvbiA2KSwgYW5kIGEgc3lz
dGVtIHJ1bnRpbWUgY29uZgo+IChzZWN0aW9uIDkpLgoKSSB0aGluayBpZiB3ZSB3YW50IHRvIHBs
YXkgaXQgc2FmZSBXUlQgdGhlIEFCSSBicmVhaywgdGhlbiB3ZSBjYW4gCmVzc2VudGlhbGx5IGp1
c3QgZG8gdGhlIHNhbWUgdGhpbmcuICBJdCdsbCBiZSBhIG11Y2ggYmlnZ2VyIGNsaWZmIGZvciB1
cyAKYmVjYXVzZSB3ZSBoYXZlIG5vIHNwYWNlIGZvciB0aGUgViBleHRlbnNpb24sIGJ1dCB0aGF0
IHdhcyBqdXN0IGEgCm1pc3Rha2UgYW5kIHRoZXJlJ3Mgbm90aGluZyB3ZSBjYW4gZG8gYWJvdXQg
aXQuCgo+IEJqw7ZybgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
