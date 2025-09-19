Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58339CAC59A
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Sep 2025 12:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5OSMbsYQJNqtaYueLmq2+GPUVflgWLSdbFnrMOUoWJs=; b=usIfPcL4SbQy4n
	7GqtISHySDPzaYAmQZHUFCXrhYRfldYGtYj3Q0ZGO4jznOHpRr2khMQAKdI4fI+F+kuCAa1/6V5HP
	ocVkEghfgzqz29omErfo3NkaUMPK7c3mWp1GUjOeOTF7lRxiscsZ0mC9q9haYRvHrn8F9jkPTC1lA
	kiunzECiESTserJM1IRJhjVhSRCILKnpnUcNEvWpqDbXeqzrNOi4E1kI/jiORPxTZ5kTzDxYiEZNh
	ByYtbVzdv3jwuTpXQw01BjTF8hvgzVAblqJpg/+N2dv53LBkkJ19a8zCYmYOzYugfPA/ziuhmDLRH
	GsXGdDHpIL1VsddOlUlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzZyX-00000002mcN-224Q;
	Fri, 19 Sep 2025 12:12:29 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzZyU-00000002mZz-2Nob
	for linux-riscv@lists.infradead.org;
	Fri, 19 Sep 2025 12:12:28 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-b523fb676efso1814263a12.3
        for <linux-riscv@lists.infradead.org>; Fri, 19 Sep 2025 05:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1758283946; x=1758888746; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t2HMMNKqDgzt194tG8vLKUMKuY47t2DmDtqHxNeA0cA=;
        b=OC1Ls03Pbq0rJrnZbWRYx8Zd96SGL8Yr+HqW4M6q7ZhpqYkWWKjaJvezfFebV/doRa
         DDveDWvO+4tAM2xnVICfCS4MN8JmCCQjz5dG1WScM8EvpnMeTwkJ8W1ObrXSxFuBPLY9
         tl8pEzIpxaAc4uDLtVC+jKeHwwvPv6qjaWwwdY55biFr01gmqxRy+K4o+yXzGAXt1Rr4
         BZ6jLdS53YXPJEpGGw6xjGD1foACNG2eP419PqJ/nHTFR3Zn1OOVwgxqE/MMQTRGxksy
         Y21lxTYLPl+TL2dPgkZxJdIsNG1P9WGGSpujFdAFXkMuk0x57gwgCqR/tAKYiMJ4veMU
         NfTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758283946; x=1758888746;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t2HMMNKqDgzt194tG8vLKUMKuY47t2DmDtqHxNeA0cA=;
        b=ERCKgtJATAN/NYoDlUMIDuwvGNuXyFkCxHQEW9pgyLbvQLxOv9K57YffQYGr+yCaRy
         YDjwBm/KrYGnZNzAEfEei31FFYM0VWxIQW3A3u46F1bebfLFUlLRZ0I57RGDOmnpOvVc
         jz8wo9SpTBl1NyGHEiPAfHr+de7AUZKVm2MwfZXSth1q5lDDiMsgkobz1qO6w+LxsgSO
         h46lzU/go/IMe88GfrrXfT2pRXzPwaA/k/76OCUO4KvEeq8+2+CeHLVVsgudU4OnCKtX
         1lnHUCxIPFmMaf7KDw0FWZIw5mspwHt8uOvpFiu9FwVxVDIL3y2s0L8Jr4FGDvkTX2U7
         VWAQ==
X-Forwarded-Encrypted: i=1; AJvYcCXCvnrMFb5MFbXhZZtivA/UU8/L13GrKkX1WlH0HbNH0DM7SVrG0/aatZTfn3uVi3ZNAZx9H0pPyeAT6Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0t8a6JvXyzJ450nyImcdpTs10+GpN1bGRBBLbHco+9Mr6Aekt
	aCsbDjK2xEyIXHhsWklyQqnZKzIdu4KXRTXClaZS7Cf7go50R4zlQxF9A5s0ar1zxwe5Eu2RCIZ
	HRDuzETFUt8Ctd/5tW1OJ4rcE6ARPyHb0UjXDwD9NJQ==
X-Gm-Gg: ASbGncsZbW7KTM+nfKklrch9EeReaN70PEYcjqGo+aK7gD20aYsJXHgWsNGzmEOBEFJ
	hYE62oeFxdb/4u7IAtgdP9l9On4O8CTOFEfiTK6V7GOlaPeosd1a6DUQNLMczOUT+ky+ZosHo1p
	WrFId4rejaX1sUhvq7OWWsNXLCUCOTaSnevwqWwnkpkvvWHMo7Sw3WdSYDJxtnWROkUt8e5kQLw
	T8cDe2cmbBh8W715KqWgOpaQfgxiKkZ+PpBvSxDn+ODOrCjEUGv
X-Google-Smtp-Source: AGHT+IGm4y1poVxGUSiB4FXU7penSJROWpZ9IBJ4RsACGtjYuoj82wxnXamn8PKPxeWN3xAf3wDL9CKqcfW9WQHchPw=
X-Received: by 2002:a17:90a:d40d:b0:32e:3f93:69f5 with SMTP id
 98e67ed59e1d1-3309836a969mr3636748a91.26.1758283945619; Fri, 19 Sep 2025
 05:12:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250919073714.83063-1-luxu.kernel@bytedance.com>
 <aM0qlTNPiaQRY2Nv@andrea> <CAPYmKFsP+=S56Cj2XT0DjdvBT_SY84moM4LVeqxHTVWbtq4EVw@mail.gmail.com>
 <CAPYmKFsV_ZPifJBtvPOdqM6_Mzhac9A4-PH9zt8TirOqAwKGhw@mail.gmail.com> <aM05J6FU0xG3SBzR@andrea>
In-Reply-To: <aM05J6FU0xG3SBzR@andrea>
From: Xu Lu <luxu.kernel@bytedance.com>
Date: Fri, 19 Sep 2025 20:12:14 +0800
X-Gm-Features: AS18NWC1LrBbaCsNeBFlqUXUWaqY8b6JknWKL06v5j39bQDtG4KDuo4wYFErj1E
Message-ID: <CAPYmKFunbrughXdG9Fpum6bxHVu9jmjQdgLVSJ_JA9z+GDsZbA@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v3 0/8] riscv: Add Zalasr ISA extension support
To: Andrea Parri <parri.andrea@gmail.com>
Cc: corbet@lwn.net, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, will@kernel.org, peterz@infradead.org, boqun.feng@gmail.com, 
	mark.rutland@arm.com, ajones@ventanamicro.com, brs@rivosinc.com, 
	anup@brainfault.org, atish.patra@linux.dev, pbonzini@redhat.com, 
	shuah@kernel.org, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, apw@canonical.com, joe@perches.com, 
	linux-doc@vger.kernel.org, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-kselftest@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_051226_610280_1AD3A2BE 
X-CRM114-Status: GOOD (  18.70  )
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

T24gRnJpLCBTZXAgMTksIDIwMjUgYXQgNzowNuKAr1BNIEFuZHJlYSBQYXJyaSA8cGFycmkuYW5k
cmVhQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiA+ID4gPiAobm90IGEgcmV2aWV3LCBqdXN0IGxvb2tp
bmcgYXQgdGhpcyBkaWZmIHN0YXQpIGlzIGNoYW5naW5nIHRoZSBmYXN0cGF0aAo+ID4gPiA+Cj4g
PiA+ID4gICByZWFkX3VubG9jaygpCj4gPiA+ID4gICByZWFkX2xvY2soKQo+ID4gPiA+Cj4gPiA+
ID4gZnJvbSBzb21ldGhpbmcgbGlrZQo+ID4gPiA+Cj4gPiA+ID4gICBmZW5jZSBydyx3Cj4gPiA+
ID4gICBhbW9kYWRkLncKPiA+ID4gPiAgIGFtb2FkZC53Cj4gPiA+ID4gICBmZW5jZSByLHJ3Cj4g
PiA+ID4KPiA+ID4gPiB0bwo+ID4gPiA+Cj4gPiA+ID4gICBmZW5jZSBydyxydwo+ID4gPiA+ICAg
YW1vYWRkLncKPiA+ID4gPiAgIGFtb2FkZC53Cj4gPiA+ID4gICBmZW5jZSBydyxydwo+ID4gPiA+
Cj4gPiA+ID4gbm8gbWF0dGVyIFphbGFzciBvciAhWmFsYXNyLiAgU2ltaWxhcmx5IGZvciBvdGhl
ciBhdG9taWMgb3BlcmF0aW9ucyB3aXRoCj4gPiA+ID4gcmVsZWFzZSBvciBhY3F1aXJlIHNlbWFu
dGljcy4gIEkgZ3Vlc3MgdGhlIGNoYW5nZSB3YXMgbm90IGludGVudGlvbmFsPwo+ID4gPiA+IElm
IGl0IHdhcyBpbnRlbnRpb25hbCwgaXQgc2hvdWxkIGJlIHByb3Blcmx5IG1lbnRpb25lZCBpbiB0
aGUgY2hhbmdlbG9nLgo+ID4gPgo+ID4gPiBTb3JyeSBhYm91dCB0aGF0LiBJdCBpcyBpbnRlbmRl
ZC4gVGhlIGF0b21pYyBvcGVyYXRpb24gYmVmb3JlCj4gPiA+IF9fYXRvbWljX2FjcXVpcmVfZmVu
Y2Ugb3Igb3BlcmF0aW9uIGFmdGVyIF9fYXRvbWljX3JlbGVhc2VfZmVuY2UgY2FuCj4gPiA+IGJl
IGp1c3QgYSBzaW5nbGUgbGQgb3Igc2QgaW5zdHJ1Y3Rpb24gaW5zdGVhZCBvZiBhbW9jYXMgb3Ig
YW1vc3dhcC4gSW4KPiA+ID4gc3VjaCBjYXNlcywgd2hlbiB0aGUgc3RvcmUgcmVsZWFzZSBvcGVy
YXRpb24gYmVjb21lcyAnc2QucmwnLCB0aGUKPiA+ID4gX19hdG9taWNfYWNxdWlyZV9mZW5jZSB2
aWEgJ2ZlbmNlIHIsIHJ3JyBjYW4gbm90IGVuc3VyZSBGRU5DRS5UU08KPiA+ID4gYW55bW9yZS4g
VGh1cyBJIHJlcGxhY2UgaXQgd2l0aCAnZmVuY2UgcncsIHJ3Jy4KPgo+IEJ1dCB5b3UgY291bGQg
YXBwbHkgc2ltaWxhciBjaGFuZ2VzIHlvdSBwZXJmb3JtZWQgZm9yIHhjaGcgJiBjbXB4Y2hnOiB1
c2UKPiAuQVEgYW5kIC5STCBmb3Igb3RoZXIgYXRvbWljIFJNVyBvcGVyYXRpb25zIGFzIHdlbGws
IG5vPyAgQUZBSUNTLCB0aGF0IGlzCj4gd2hhdCBhcm02NCBhY3R1YWxseSBkb2VzIGluIGFyY2gv
YXJtNjQvaW5jbHVkZS9hc20vYXRvbWljX3tsbF9zYyxsc2V9LmggLgoKSSBzZWUuIEkgd2lsbCBz
dHVkeSB0aGUgaW1wbGVtZW50YXRpb24gb2YgQVJNIGFuZCByZWZpbmUgbXkgcGF0Y2guIFRoYW5r
cyBhIGxvdC4KCkJlc3QgcmVnYXJkcywKWHUgTHUKCj4KPiAgIEFuZHJlYQo+Cj4KPiA+IFRoaXMg
aXMgYWxzbyB0aGUgY29tbW9uIGltcGxlbWVudGF0aW9uIG9uIG90aGVyIGFyY2hpdGVjdHVyZXMg
d2hvIHVzZQo+ID4gYXEvcmwgaW5zdHJ1Y3Rpb25zIGxpa2UgQVJNLiBBbmQgeW91IGNlcnRhaW5s
eSBhbHJlYWR5IGtuZXcgaXR+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
