Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 020F0C021B8
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Mar 2025 09:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rwdpJIKoHP7sTexsCS9Hi4794R4nDo7TB0+o3GNpIcU=; b=RHs7YiUZSofUfG
	yPNK1MNAekPq30Hftfn73E2ZPoWPkPaACM9asdOAhEbKMoMJBZEcuVBZyM8dEdMejbgTHx9Ej2Ck2
	Qm0QHD6IVd8CS6/jrPvuqjQIRJgWPjD6GWSs0hM8k3FOqy46P/tjVlo81gRgsQNxqymWWq0/1TVsM
	Q48LcX25uAkT+DxdwuwSgrvqyfIiYzt/cKieUs0QaI9h1dDfYXbJjW3n2oFe91GD12E0EV8cTTLzc
	lo0X/XLL/n2BASqUxE5Ps7NI4cH2YtfbqcX26H+iE2C1/THaUigHwhglC0RUvLu484H4feMfQDESf
	8+ZWm98tXW8spht+NNdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpOAW-00000003lHh-476b;
	Tue, 04 Mar 2025 09:02:28 +0000
Received: from mail-ua1-x934.google.com ([2607:f8b0:4864:20::934])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpOAU-00000003lGd-2TRg
	for linux-riscv@lists.infradead.org;
	Tue, 04 Mar 2025 09:02:27 +0000
Received: by mail-ua1-x934.google.com with SMTP id a1e0cc1a2514c-86929964ed3so4841225241.0
        for <linux-riscv@lists.infradead.org>; Tue, 04 Mar 2025 01:02:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1741078945; x=1741683745; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kHhfxt/F9VYJEMZWHBt7TIGLZbK9Gj/o15ch1mv6/fM=;
        b=iMoaRzAhSyjGWjhU4obh4wKj348rWS6IJfqvEqOEOmXvVXdHmj5EuTD38CK7vWoHCV
         fvJ0quRVk8rsOfo0Eh/IijdF+nNautDH3klk2evcqjg8boHVoSCML0yVPLf8Dzmvh5EP
         70Kox6kawibrIheAkQu62RW2LrQ3uTB/ZCTiDXNWrZ03B09L+RBzRstKc+xWj2TacUsq
         3H8hKQ2QEevIpJwiuczdZKTjNyKss040pTqDWDzzq6+j9D67xfoW9ZkLuXMJQ5vlqvwN
         Vt/72GjhI+soXL4MZerJeSMcDPgfq67ulaUyvPSVF9g7ekuG+GZG5jPRXmqSxE3ol9lR
         rPdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741078945; x=1741683745;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kHhfxt/F9VYJEMZWHBt7TIGLZbK9Gj/o15ch1mv6/fM=;
        b=AVyEvIc0o00itAhLZLMcruekKnGTCxNrkwsfYXVqCutWBUWIMzMrVVRic6Y79t+fRp
         dFZWl9ZrbRKGYGFHdp7jOO2WyPvInQ47ykG7stewyNALapngoGiDvNrQlBBBBcefwoKE
         xr/JZ7qi4DmiVjiqpWTPy4lr2jn1YJRRQujfgnB2IVE8ABd3OXJLvD6npBNDJR1kNBx6
         TipFpahd9ouOu5fuGlARFPgNlcGIokHbVEUs1PsYohyG5Zk/TUICVY+0UAMObE8MrvKl
         Y4HAtV/ZXbq8rBtRMJf1qdCmfmD6pUzQFjwPRK1eePgAEy6yvTLpzyOmgbUFAcBesB5k
         LWfw==
X-Forwarded-Encrypted: i=1; AJvYcCXfcb6nWL5O2Hd27NB+kLoCRz1Ts8e8V6HzbvXKDnmDS4geqxj6F9/PUC58HJI/5ZjS0r+IIR93oAu0PA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzpw++Y67Y1OOhe3ApsBY8iD02uS25gTlXkB8W9qfaN+JKHFdmb
	05KYCAAot8DbUebwB9xwMdw2XbZEvimv/DhYwT4ByFv7llaj1GasEAmXg+K34xZeEgGiYKDmiZc
	c4Pap9OiFbH4QR23+PXTR+oCNFW2eWSi5H/2NXQ==
X-Gm-Gg: ASbGncszSgQuy4BIAK3awBGMcILWZ+NSASciaP8tgOQ7SQnbxFXGHArqf7ni6hnnd5N
	cJwQBVCPGJnbqYe+Kj8fGh84UYcxJYglcMI6gxAz9EAFvFiUkpuae8pKYNsx4fRrGF/K6vExeWy
	Ycn9UjdnV3Mvyw0+f9OFYs/ZGM+7Ei
X-Google-Smtp-Source: AGHT+IE+NGonMa9x6tx3hTAC6JJ2acGmU95KDumJyPPEYsvv1984PUWQmP4MK//XiwgrQPqZuV+47KFn1mDTkh4WWnY=
X-Received: by 2002:a05:6102:3f4a:b0:4c0:3349:cc4 with SMTP id
 ada2fe7eead31-4c0448efd2emr11486700137.3.1741078944773; Tue, 04 Mar 2025
 01:02:24 -0800 (PST)
MIME-Version: 1.0
References: <20241224093902.1632627-1-nylon.chen@sifive.com>
 <zqkx7cx5nalslfmxeoxdnsjbvrvzajrjybsmsyeyc65a64sntr@gpc5qp6aoyp7>
 <CAHh=Yk-_0rKB=FG6Voif2MDjtRxzUA5vXDP2J-o5=8ru1ewt0w@mail.gmail.com>
 <CAHh=Yk-TosOmwEughfK9mMx-=DgzWK5H_bf6H641SGh1ue8BrA@mail.gmail.com>
 <zneb3qwgf52zitcbq4wz76shnmhwfkabbsts3sussjpc5s5tsz@uneaxdfp4m2f>
 <CAHh=Yk_oTdURhkna_saF6mrA9gDY=+v_j5NoY_7jTDLuZ=EXtg@mail.gmail.com>
 <7bcnckef23w6g47ll5l3bktygedrcfvr7fk3qjuq2swtoffhec@zs4w4tuh6qvm>
 <5robb7ipl346daf3lqaqnsi3fcgj3wzmch5dqit2dczdyeknmv@dqft77bhwryg> <CAHh=Yk-p69ppWWspEzzznhDnuk3i6dRGKzUaqZCwg_uAxB3FVA@mail.gmail.com>
In-Reply-To: <CAHh=Yk-p69ppWWspEzzznhDnuk3i6dRGKzUaqZCwg_uAxB3FVA@mail.gmail.com>
From: Nylon Chen <nylon.chen@sifive.com>
Date: Tue, 4 Mar 2025 17:02:13 +0800
X-Gm-Features: AQ5f1Jp7DGsp1Vyy94pQwTGcyJhhurEJDZS278bFkBXavKP5rDxyvxdNjmgaOc0
Message-ID: <CAHh=Yk8kC1+D4dPQ7iAtn1WSPSk+OU6vwEyGF9VZAS5o5gPHmA@mail.gmail.com>
Subject: Re: [PATCH v10 0/3] Change PWM-controlled LED pin active mode and algorithm
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Samuel Holland <samuel.holland@sifive.com>, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_010226_649613_8CE2E1EE 
X-CRM114-Status: GOOD (  26.10  )
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

Tnlsb24gQ2hlbiA8bnlsb24uY2hlbkBzaWZpdmUuY29tPiDmlrwgMjAyNeW5tDHmnIgyM+aXpSDp
gLHlm5sg5LiK5Y2IODoyMOWvq+mBk++8mgo+Cj4gVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5l
LWtvZW5pZ0BiYXlsaWJyZS5jb20+IOaWvCAyMDI15bm0MeaciDIy5pelIOmAseS4iSDkuIvljYg3
OjQ05a+r6YGT77yaCj4gPgo+ID4gSGVsbG8gTnlsb24sCj4gPgo+ID4gSSB0b29rIGFub3RoZXIg
bG9vayBpbiB0aGUgZHJpdmVyIGFuZCBmb3VuZCBhbm90aGVyIHByb2JsZW06Cj4gSGkgVXdlLCBU
aGFuayB5b3UgZm9yIHRoZSBpbmZvcm1hdGlvbi4KPgo+IEknbGwgbmVlZCBzb21lIHRpbWUgdG8g
dmVyaWZ5IGFuZCB1bmRlcnN0YW5kIHRoZXNlIGRldGFpbHMsIGFzIHdlbGwgYXMKPiBjb25kdWN0
IHRoZSByZWxldmFudCB0ZXN0cwo+ID4KPiA+IE9uIFR1ZSwgSmFuIDIxLCAyMDI1IGF0IDA3OjEy
OjEwUE0gKzAxMDAsIFV3ZSBLbGVpbmUtS8O2bmlnIHdyb3RlOgo+ID4gPiBPbiBUdWUsIEphbiAy
MSwgMjAyNSBhdCAwNDo0Nzo0NlBNICswODAwLCBOeWxvbiBDaGVuIHdyb3RlOgo+ID4gPiA+IFV3
ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAYmF5bGlicmUuY29tPiDmlrwgMjAyNeW5
tDHmnIgyMeaXpSDpgLHkuowg5LiL5Y2IMzo0N+Wvq+mBk++8mgo+ID4gPiA+ID4KPiA+ID4gPiA+
IEhlbGxvLAo+ID4gPiA+ID4KPiA+ID4gPiA+IE9uIFN1biwgSmFuIDE5LCAyMDI1IGF0IDAzOjAz
OjE2UE0gKzA4MDAsIE55bG9uIENoZW4gd3JvdGU6Cj4gPiA+ID4gPiA+IEkgcmFuIHNvbWUgYmFz
aWMgdGVzdHMgYnkgY2hhbmdpbmcgdGhlIHBlcmlvZCBhbmQgZHV0eSBjeWNsZSBpbiBib3RoCj4g
PiA+ID4gPiA+IGRlY3JlYXNpbmcgYW5kIGluY3JlYXNpbmcgc2VxdWVuY2VzIChzZWUgdGhlIHNj
cmlwdCBiZWxvdykuCj4gPiA+ID4gPgo+ID4gPiA+ID4gV2hhdCBpcyBjbGtfZ2V0X3JhdGUoZGRh
dGEtPmNsaykgZm9yIHlvdT8KPiA+ID4gPiAxMzAgTUh6Cj4gPiA+Cj4gPiA+IE9LLCBzbyB0aGUg
cG9zc2libGUgcGVyaW9kIGxlbmd0aHMgYXJlCj4gPiA+Cj4gPiA+ICAgICAgICgxIDw8ICgxNiAr
IHNjYWxlKSkgLyAoMTMwIE1IeikKPiA+ID4KPiA+ID4gZm9yIHNjYWxlIGluIFswLCAuLiAxNV0s
IHJpZ2h0PyBUaGF0J3MKPiA+ID4KPiA+ID4gICAgICAgMl5zY2FsZSAqIDUwNDEyMy4wNzY5MjMw
NzY5NCBucwo+ID4gPgo+ID4gPiBTbyB0ZXN0aW5nIHBlcmlvZCBpbiB0aGUgcmFuZ2UgYmV0d2Vl
biA1MDAwIG5zIGFuZCAxNTAwMCBucyBpc24ndAo+ID4gPiBzZW5zaWJsZT8gRGlkIEkgZ2V0IHNv
bWV0aGluZyB3cm9uZz8gSWYgdGhlIGFib3ZlIGlzIHJpZ2h0LCBzd2l0Y2hpbmcKPiA+ID4gYmV0
d2VlbiBwZXJpb2Q9MTAwODI0NiBucyBhbmQgMTAwODI0NyBucyBpcyBsaWtlbHkgdG8gdHJpZ2dl
ciBhCj4gPiA+IHdhcm5pbmcuCj4gPgo+ID4gVGhlIHBvc3NpYmxlIHBlcmlvZHMgYXJlIG9mIHRo
ZSBmb3JtCj4gPgo+ID4gICAgICAgICAyXnNjYWxlICogQQo+ID4KPiA+IHdoZXJlIEEgaXMgY29u
c3RhbnQgYW5kIG9ubHkgZGVwZW5kcyBvbiB0aGUgaW5wdXQgY2xvY2sgcmF0ZS4gc2NhbGUKPiA+
IHJhbmdlcyBvdmVyIFswLCAuLi4gMTVdLiAoSWYgSSBnb3QgaXQgcmlnaHQgaW4gbXkgbGFzdCBt
YWlsLCB3ZSBoYXZlIEEgPQo+ID4gNTA0MTIzLjA3NjkyMzA3Njk0IG5zLikKPiA+Cj4gPiBJZiB5
b3UgcmVxdWVzdCBzYXk6Cj4gPgo+ID4gICAgICAgICAucGVyaW9kID0gMy45ICogQQo+ID4gICAg
ICAgICAuZHV0eV9jeWNsZSA9IDEuOSAqIEEKPiA+Cj4gPiB0aGUgcGVyaW9kIGFjdHVhbGx5IGVt
aXR0ZWQgYnkgdGhlIFBXTSB3aWxsIGJlIDIgKiBBLiBCdXQgdG8gY2FsY3VsYXRlCj4gPiBmcmFj
IHRoZSBvcmlnaW5hbGx5IHJlcXVlc3RlZCBwZXJpb2QgKGkuZS4gMy45ICogQSkgaXMgdXNlZC4g
U28gZnJhYwo+ID4gYmVjb21lcyAzMTkyNyByZXN1bHRpbmcgaW4gLmR1dHlfY3ljbGUgYmVpbmcg
fjAuOTc0IEEuIEEgYmV0dGVyIHZhbHVlCj4gPiB3b3VsZCBiZSBmcmFjID0gNjIyNTkgd2hpY2gg
cmVzdWx0cyBpbiAuZHV0eV9jeWNsZSDiiYUgMS45ICogQS4KPiA+IChEZXBlbmRpbmcgb24gQSB0
aGUgdmFsdWVzIGZvciBmcmFjIG1pZ2h0IGJlIG9mZiBieSBvbmUgZHVlIHRvIHJvdW5kaW5nCj4g
PiBkaWZmZXJlbmNlcy4pCj4gPgo+ID4gU28gSSB3b3VsZCBleHBlY3QgdGhhdCBQV01fREVCVUcg
aXMgYW5ncnkgd2l0aCB5b3UgaWYgeW91IGdvIGZyb20KPiA+Cj4gPiAgICAgICAgIC5wZXJpb2Qg
PSAyICogQQo+ID4gICAgICAgICAuZHV0eV9jeWNsZSA9IDEuOSAqIEEKPiA+Cj4gPiB0bwo+ID4K
PiA+ICAgICAgICAgLnBlcmlvZCA9IDMuOSAqIEEKPiA+ICAgICAgICAgLmR1dHlfY3ljbGUgPSAx
LjkgKiBBCj4gPgo+ID4gLgo+ID4KPiA+IEJlc3QgcmVnYXJkcwo+ID4gVXdlCgpIaSBVd2UsIEJh
c2VkIG9uIHlvdXIgc3VnZ2VzdGlvbnMsIEkgY29uZHVjdGVkIHJlbGV2YW50IHRlc3RzIGFuZApj
b3JyZWN0ZWQgYWxnb3JpdGhtIGVycm9ycy4KCkFjY29yZGluZyB0byB0aGlzIHRlc3QgcHJvZ3Jh
bSwgSSBjYW4gbWFrZSB0aGUgc3lzdGVtIGdlbmVyYXRlIHJlbGF0ZWQKZXJyb3IgbWVzc2FnZXMg
b24gdjEwJ3MgcGF0Y2hzZXQuCgplLmcuClsgNzUuMDQzNjUyXSBwd20tc2lmaXZlIDEwMDIxMDAw
LnB3bTogLmFwcGx5IGlzIHN1cHBvc2VkIHRvIHJvdW5kIGRvd24KZHV0eV9jeWNsZSAocmVxdWVz
dGVkOiAzNjAvNTA0MDAwLCBhcHBsaWVkOiAzNjEvNTA0MTI0KQpbIDc1LjA1NTA0Ml0gcHdtLXNp
Zml2ZSAxMDAyMTAwMC5wd206IC5hcHBseSBpcyBzdXBwb3NlZCB0byByb3VuZCBkb3duCnBlcmlv
ZCAocmVxdWVzdGVkOiA1MDQwMDAsIGFwcGxpZWQ6IDUwNDEyNCkKClBXTUNISVA9MQpQV01DSEFO
TkVMPTAKUEVSSU9EPTUwNDAwMApTVEVQPTEKTUFYX0RVVFk9NTA0MDAwCgplY2hvIDAgPiAvc3lz
L2NsYXNzL3B3bS9wd21jaGlwJHtQV01DSElQfS9leHBvcnQKCmVjaG8gJFBFUklPRCA+IC9zeXMv
Y2xhc3MvcHdtL3B3bWNoaXAke1BXTUNISVB9L3B3bSR7UFdNQ0hBTk5FTH0vcGVyaW9kCmVjaG8g
IlNldCBwZXJpb2QgdG8gJFBFUklPRCBucyAoc2NhbGU9MCByZWdpb24pIgoKQ09VTlQ9JCgoTUFY
X0RVVFkgLyBTVEVQKSkKZWNobyAiVGVzdGluZyBkdXR5LWN5Y2xlIGZyb20gMCB0byAkTUFYX0RV
VFkgaW4gc3RlcCBvZiAkU1RFUC4uLiIKZWNobyAiVG90YWwgc3RlcHMgKGZvcndhcmQpOiAkKChD
T1VOVCsxKSkiCgoKQ1VSUkVOVD0wCndoaWxlIFsgJENVUlJFTlQgLWxlICRNQVhfRFVUWSBdOyBk
bwogICAgZWNobyAkQ1VSUkVOVCA+IC9zeXMvY2xhc3MvcHdtL3B3bWNoaXAke1BXTUNISVB9L3B3
bSR7UFdNQ0hBTk5FTH0vZHV0eV9jeWNsZQogICAgQ1VSUkVOVD0kKChDVVJSRU5UICsgU1RFUCkp
CmRvbmUKCmVjaG8gIk5vdyBkbyBhIGJhY2t3YXJkIHRlc3QgZnJvbSAkTUFYX0RVVFkgZG93biB0
byAwIGluIHN0ZXAgb2YgJFNURVAuLi4iCmVjaG8gIlRvdGFsIHN0ZXBzIChiYWNrd2FyZCk6ICQo
KENPVU5UKzEpKSIKCgpDVVJSRU5UPSRNQVhfRFVUWQp3aGlsZSBbICRDVVJSRU5UIC1nZSAwIF07
IGRvCiAgICBlY2hvICRDVVJSRU5UID4gL3N5cy9jbGFzcy9wd20vcHdtY2hpcCR7UFdNQ0hJUH0v
cHdtJHtQV01DSEFOTkVMfS9kdXR5X2N5Y2xlCiAgICBDVVJSRU5UPSQoKENVUlJFTlQgLSBTVEVQ
KSkKZG9uZQoKCmVjaG8gMCA+IC9zeXMvY2xhc3MvcHdtL3B3bWNoaXAke1BXTUNISVB9L3B3bSR7
UFdNQ0hBTk5FTH0vZW5hYmxlCmVjaG8gJHtQV01DSEFOTkVMfSA+IC9zeXMvY2xhc3MvcHdtL3B3
bWNoaXAke1BXTUNISVB9L3VuZXhwb3J0CgplY2hvICJEb25lISIKCkJhc2VkIG9uIHlvdXIgcHJl
dmlvdXMgc3VnZ2VzdGlvbnMsIEkgaGF2ZSBtYWRlIHRoZSBmb2xsb3dpbmcgcmVsYXRlZAptb2Rp
ZmljYXRpb25zLCBhbmQgbm93IEknbSBhYmxlIHRvIGZpeCB0aGUgcmVsZXZhbnQgZXJyb3JzLgoK
QnV0IEkgd2FudCB0byBtYWtlIHN1cmUgbXkgdW5kZXJzdGFuZGluZyBhbGlnbnMgd2l0aCB5b3Vy
IHN1Z2dlc3Rpb25zLApzbyBJJ2QgbGlrZSB0byBkaXNjdXNzIHdpdGggeW91IGZpcnN0IGJlZm9y
ZSBzZW5kaW5nIHRoZSBwYXRjaC4KCi0gSW4gLmFwcGx5LCB1c2UgInJvdW5kIGRvd24iIGZvciBj
YWxjdWxhdGlvbnMgdG8gZW5zdXJlIHRoZSB2YWx1ZQpkb2Vzbid0IGV4Y2VlZCB3aGF0IHRoZSB1
c2VyIHJlcXVlc3RlZC4gKE5ldmVyIHNldCBhIGR1dHkgY3ljbGUgaGlnaGVyCnRoYW4gd2hhdCB0
aGUgdXNlciByZXF1ZXN0ZWQuKQpwd21fc2lmaXZlX2FwcGx5KCkgewogICAgLSBmcmFjID0gRElW
NjRfVTY0X1JPVU5EX0NMT1NFU1QobnVtLCBzdGF0ZS0+cGVyaW9kKTsKICAgICtmcmFjID0gbnVt
IC8gc3RhdGUtPnBlcmlvZDsKfQotIFdoZW4gY29udmVydGluZyBoYXJkd2FyZSB2YWx1ZXMgYmFj
ayB0byBkdXR5X2N5Y2xlIGluIC5nZXRfc3RhdGUsCnVzZSAicm91bmQgdXAiIHRvIGNvbXBlbnNh
dGUgZm9yIHRoZSBlcnJvcnMgaW50cm9kdWNlZCBieSAuYXBwbHkuKCkKcHdtX3NpZml2ZV9nZXRf
c3RhdGUoKSB7CiAgICAtIHN0YXRlLT5kdXR5X2N5Y2xlID0gKHU2NClkdXR5ICogZGRhdGEtPnJl
YWxfcGVyaW9kID4+IFBXTV9TSUZJVkVfQ01QV0lEVEg7CiAgICArIHN0YXRlLT5kdXR5X2N5Y2xl
ID0gRElWX1JPVU5EX1VQX1VMTCgodTY0KWR1dHkgKgpkZGF0YS0+cmVhbF9wZXJpb2QsICgxVSA8
PCBQV01fU0lGSVZFX0NNUFdJRFRIKSk7Cn0KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
