Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E3DFC3064D
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Jun 2024 15:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EpewdrVsmvYnLioU9H8b3US1RrT/P5xDbm3ilmjP0uA=; b=44ciWzZ4Dv6Mij
	k1csWzViuWoE24furRw0V+PPSI0rsABI7JQ9npPuWztUPnrF/V0KKpYVC8gHEYCJHMJVgyt5PQAGL
	+Fmiu/mwMrR6YO8qzbn/Tua2Ku68+lCp0MEHcd7bQ8XtM44jqL3eKvGMnuZyUs0RdNEBMHrTQ6TJ7
	Qanvld16eu/kREVh1E9l5NHvyg3V/WnJD80ct6i8TbC9IciNODLb6jQ+B5XclVLDBrt1KJmlzTIt1
	aZr2LiR1N1C0NDTp5fJDRHBLP6G4gsu/P6LSkL/P07eAbZhNnGedKM08THVGm4RTF5QqVMCMhTyOT
	qCHbZB7iMFsz6FXdVIkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMUjq-00000007QtN-1aU4;
	Wed, 26 Jun 2024 15:39:14 +0000
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMUjl-00000007QrE-2JCS
	for linux-riscv@lists.infradead.org;
	Wed, 26 Jun 2024 15:39:12 +0000
Received: by mail-il1-x12a.google.com with SMTP id e9e14a558f8ab-376211b3a4fso2153245ab.1
        for <linux-riscv@lists.infradead.org>; Wed, 26 Jun 2024 08:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1719416348; x=1720021148; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wvzxB+Wa86xaSK5lnqOhKYjBXjWn6DeMPRI2dct18cg=;
        b=sTFcnADU3M1RGqG3E7MJOesDZSIwWK4NYMTCxE/8Bxwo6/7mFxPBdmWZTPIE0w7zy/
         MZusiy7zjtcHAkbe0yvXCnMqwqpz4uS994SoAq05ZKl2zhCnjx1InuV+o2kluhCtFUIV
         fBYH/97vPVq8tylUm6xPWaTDFHDqVKJ3EPhvvF2uUSsiL4U1JaYzBHGhHhO4vts8yeWa
         pL+7l71dg3oKFyWzQd4y0q0Pg3pQjjB7srM05k8HjGqXTs0UvRx5PgPMIx2PFPeXBmJf
         u892wb5h8pAq1eIDqYUYU05eqP6oG7tvmYR5Fc3o5p93miYEaD9ShDN/7Bc+EO5I53yy
         3qUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719416348; x=1720021148;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wvzxB+Wa86xaSK5lnqOhKYjBXjWn6DeMPRI2dct18cg=;
        b=TByNBJDQDSFWn4doiY1ECbx7Om0hXZ/H0bAZJuBJH8CN/jImZVz2GNhtWsysGshfx7
         EJXlIDv2DlHYDus42VGK9Ngiw1vUDKMf7qi2JdinZqzRt9bvIwHyzaFpgXuaeWYaTwGm
         z3O7648diONnZ4rDDNmr0FNvFz+XGwAVmUHgXjG0VPmL/sRKhf4u5FtN/+2HZH/lwfb6
         UhYiBzosmQglAMDJBDgCp170hIdef4dS0yYiVNgr0B/5k6JDjZ4dtI+vCR8nhQAbuXIG
         MRgWvGHkPh5ih6rnND4sqPlnH3unkr8LX6r1e0dArV6IExulNS+eeb6o7pfXupDx8ASF
         PLHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZ5s4wmJ+wnqaFbMKzNhjrh3v6RLhCeKDNJSmkH6kgyAHmWwE0XBkYqtsoCZxqUKVnRJJLD7FIJD6zSro3z7OtkcA+ODUgLnsbIzeRaKF3
X-Gm-Message-State: AOJu0Yy0twrJcdP/C/QQKaSzJ1azmF1tLhIXCrbeH67ADvZvlVfrrOti
	vVcoqa3HFD/1kyc1qZCJTyWNqSCv/afuRAbqXmcQAQo71rjLRVlHuVdT9wV9iho6aK1RyxvYAs7
	g/r+vDb01UPGtMYcsAthbYVFW59wBsswXv34YXQ==
X-Google-Smtp-Source: AGHT+IH1sQ42nSQm2aRgsueyYRQdo0XMxrFyeQ+EQYp/DQqJ5Hp3nD/SVMMsjp0hgIysP+g1yym2HXV7xKKsXUL5aOg=
X-Received: by 2002:a05:6e02:219a:b0:378:535c:9878 with SMTP id
 e9e14a558f8ab-378535c99b5mr7484845ab.17.1719416348127; Wed, 26 Jun 2024
 08:39:08 -0700 (PDT)
MIME-Version: 1.0
References: <20240603-f8650a2cc220b73cf52d77c7@orel> <mhng-4fc810f5-fd3a-44f3-bd78-9a6b7bf2ab77@palmer-ri-x1c9>
In-Reply-To: <mhng-4fc810f5-fd3a-44f3-bd78-9a6b7bf2ab77@palmer-ri-x1c9>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 26 Jun 2024 21:08:56 +0530
Message-ID: <CAAhSdy37GxVnH0vvowpf4BeBT-f8YcoUFcNR32wioZBObKiUMw@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] riscv: Apply Zawrs when available
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: ajones@ventanamicro.com, linux-riscv@lists.infradead.org, 
	kvm-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, 
	Conor Dooley <conor.dooley@microchip.com>, atishp@atishpatra.org, robh@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	christoph.muellner@vrull.eu, Heiko Stuebner <heiko@sntech.de>, 
	Charlie Jenkins <charlie@rivosinc.com>, David.Laight@aculab.com, parri.andrea@gmail.com, 
	luxu.kernel@bytedance.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240626_083910_560221_53C9A39B 
X-CRM114-Status: GOOD (  44.20  )
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

SGkgUGFsbWVyLAoKT24gV2VkLCBKdW4gMjYsIDIwMjQgYXQgODowNOKAr1BNIFBhbG1lciBEYWJi
ZWx0IDxwYWxtZXJAZGFiYmVsdC5jb20+IHdyb3RlOgo+Cj4gT24gTW9uLCAwMyBKdW4gMjAyNCAw
NTozNjo0MiBQRFQgKC0wNzAwKSwgYWpvbmVzQHZlbnRhbmFtaWNyby5jb20gd3JvdGU6Cj4gPiBI
aSBQYWxtZXIsCj4gPgo+ID4gSSBzdWJtaXQgb3VyIGNvbmNlcm5zIG9mIHdycy5udG8gdG8gUlZJ
IEFSQyBmb3IgY29uc2lkZXJhdGlvbi4gVGhleQo+ID4gZGlzY3Vzc2VkIGl0IGJ1dCBkb24ndCBi
ZWxpZXZlIHRoZXJlJ3MgYSBuZWVkIGZvciBjb25jZXJuLiBUaGUKPiA+IGV4cGVjdGF0aW9uIGlz
IHRoYXQgdGhlcmUgd2lsbCBhbHdheXMgYmUgZW5vdWdoIGludGVycnVwdCBhY3Rpdml0eQo+ID4g
YW5kIHRoYXQgdGhvc2UgaW50ZXJydXB0cyB3aXRoIGFjdGl2aXR5IHdpbGwgbm90IGxpa2VseSBi
ZSBsb2NhbGx5Cj4gPiBkaXNhYmxlZC4KPiA+Cj4gPiBDYW4gd2UgY29uc2lkZXIgdGhpcyBzZXJp
ZXMgZm9yIDYuMTA/Cj4KPiBTb3JyeSBJIGZvcmdvdCBhYm91dCB0aGlzIG9uZSwgQW51cCBqdXN0
IGJyb3VnaHQgaXQgdXAgaW4gdGhlIHBhdGNod29yawo+IG1lZXRpbmcuICBIZSdzIGdvaW5nIHRv
IGFjayB0aGUgS1ZNIGJpdHMsIHRoZW4gSSdsbCBwaWNrIGl0IHVwLgoKSSBoYXZlIEFja2VkIHRo
ZSBLVk0gYml0cyBzbyBwbGVhc2UgZ28gYWhlYWQgd2l0aCB0aGlzIHNlcmllcy4KClJlZ2FyZHMs
CkFudXAKCj4KPiA+Cj4gPiBUaGFua3MsCj4gPiBkcmV3Cj4gPgo+ID4gT24gRnJpLCBBcHIgMjYs
IDIwMjQgYXQgMTI6MDg6MjBQTSBHTVQsIEFuZHJldyBKb25lcyB3cm90ZToKPiA+PiBaYXdycyBw
cm92aWRlcyB0d28gaW5zdHJ1Y3Rpb25zICh3cnMubnRvIGFuZCB3cnMuc3RvKSwgd2hlcmUgYm90
aCBhcmUKPiA+PiBtZWFudCB0byBhbGxvdyB0aGUgaGFydCB0byBlbnRlciBhIGxvdy1wb3dlciBz
dGF0ZSB3aGlsZSB3YWl0aW5nIG9uIGEKPiA+PiBzdG9yZSB0byBhIG1lbW9yeSBsb2NhdGlvbi4g
VGhlIGluc3RydWN0aW9ucyBhbHNvIGJvdGggd2FpdCBhbgo+ID4+IGltcGxlbWVudGF0aW9uLWRl
ZmluZWQgInNob3J0IiBkdXJhdGlvbiAodW5sZXNzIHRoZSBpbXBsZW1lbnRhdGlvbgo+ID4+IHRl
cm1pbmF0ZXMgdGhlIHN0YWxsIGZvciBhbm90aGVyIHJlYXNvbikuIFRoZSBkaWZmZXJlbmNlIGlz
IHRoYXQgd2hpbGUKPiA+PiB3cnMuc3RvIHdpbGwgdGVybWluYXRlIHdoZW4gdGhlIGR1cmF0aW9u
IGVsYXBzZXMsIHdycy5udG8sIGRlcGVuZGluZyBvbgo+ID4+IGNvbmZpZ3VyYXRpb24sIHdpbGwg
ZWl0aGVyIGp1c3Qga2VlcCB3YWl0aW5nIG9yIGFuIElMTCBleGNlcHRpb24gd2lsbCBiZQo+ID4+
IHJhaXNlZC4gTGludXggd2lsbCB1c2Ugd3JzLm50bywgc28gaWYgcGxhdGZvcm1zIGhhdmUgYW4g
aW1wbGVtZW50YXRpb24KPiA+PiB3aGljaCBmYWxscyBpbiB0aGUgImp1c3Qga2VlcCB3YWl0aW5n
IiBjYXRlZ29yeSAod2hpY2ggaXMgbm90IGV4cGVjdGVkKSwKPiA+PiB0aGVuIGl0IHNob3VsZCBf
bm90XyBhZHZlcnRpc2UgWmF3cnMgaW4gdGhlIGhhcmR3YXJlIGRlc2NyaXB0aW9uLgo+ID4+Cj4g
Pj4gTGlrZSB3ZmkgKGFuZCB3aXRoIHRoZSBzYW1lIHttLGh9c3RhdHVzIGJpdHMgdG8gY29uZmln
dXJlIGl0KSwgd2hlbgo+ID4+IHdycy5udG8gaXMgY29uZmlndXJlZCB0byByYWlzZSBleGNlcHRp
b25zIGl0J3MgZXhwZWN0ZWQgdGhhdCB0aGUgaGlnaGVyCj4gPj4gcHJpdmlsZWdlIGxldmVsIHdp
bGwgc2VlIHRoZSBpbnN0cnVjdGlvbiB3YXMgYSB3YWl0IGluc3RydWN0aW9uLCBkbwo+ID4+IHNv
bWV0aGluZywgYW5kIHRoZW4gcmVzdW1lIGV4ZWN1dGlvbiBmb2xsb3dpbmcgdGhlIGluc3RydWN0
aW9uLiBGb3IKPiA+PiBleGFtcGxlLCBLVk0gZG9lcyBjb25maWd1cmUgZXhjZXB0aW9ucyBmb3Ig
d2ZpIChoc3RhdHVzLlZUVz0xKSBhbmQKPiA+PiB0aGVyZWZvcmUgYWxzbyBmb3Igd3JzLm50by4g
S1ZNIGRvZXMgdGhpcyBmb3Igd2ZpIHNpbmNlIGl0J3MgYmV0dGVyIHRvCj4gPj4gYWxsb3cgb3Ro
ZXIgdGFza3MgdG8gYmUgc2NoZWR1bGVkIHdoaWxlIGEgVkNQVSB3YWl0cyBmb3IgYW4gaW50ZXJy
dXB0Lgo+ID4+IEZvciB3YWl0cyBzdWNoIGFzIHRob3NlIHdoZXJlIHdycy5udG8vc3RvIHdvdWxk
IGJlIHVzZWQsIHdoaWNoIGFyZQo+ID4+IHR5cGljYWxseSBsb2NrcywgaXQgaXMgYWxzbyBhIGdv
b2QgaWRlYSBmb3IgS1ZNIHRvIGJlIGludm9sdmVkLCBhcyBpdAo+ID4+IGNhbiBhdHRlbXB0IHRv
IHNjaGVkdWxlIHRoZSBsb2NrIGhvbGRpbmcgVkNQVS4KPiA+Pgo+ID4+IFRoaXMgc2VyaWVzIHN0
YXJ0cyB3aXRoIENocmlzdG9waCdzIGFkZGl0aW9uIG9mIHRoZSByaXNjdgo+ID4+IHNtcF9jb25k
X2xvYWRfcmVsYXhlZCBmdW5jdGlvbiB3aGljaCBhcHBsaWVzIHdycy5zdG8gd2hlbiBhdmFpbGFi
bGUuCj4gPj4gVGhhdCBwYXRjaCBoYXMgYmVlbiByZXdvcmtlZCB0byB1c2Ugd3JzLm50byBhbmQg
dG8gdXNlIHRoZSBzYW1lIGFwcHJvYWNoCj4gPj4gYXMgQXJtIGZvciB0aGUgd2FpdCBsb29wLCBz
aW5jZSB3ZSBjYW4ndCBoYXZlIGFyYml0cmFyeSBDIGNvZGUgYmV0d2Vlbgo+ID4+IHRoZSBsb2Fk
LXJlc2VydmVkIGFuZCB0aGUgd3JzLiBUaGVuLCBod3Byb2JlIHN1cHBvcnQgaXMgYWRkZWQgKHNp
bmNlIHRoZQo+ID4+IGluc3RydWN0aW9ucyBhcmUgYWxzbyB1c2FibGUgZnJvbSB1c2VybW9kZSks
IGFuZCBmaW5hbGx5IEtWTSBpcwo+ID4+IHRhdWdodCBhYm91dCB3cnMubnRvLCBhbGxvd2luZyBn
dWVzdHMgdG8gc2VlIGFuZCB1c2UgdGhlIFphd3JzCj4gPj4gZXh0ZW5zaW9uLgo+ID4+Cj4gPj4g
V2Ugc3RpbGwgZG9uJ3QgaGF2ZSB0ZXN0IHJlc3VsdHMgZnJvbSBoYXJkd2FyZSwgYW5kIGl0J3Mg
bm90IHBvc3NpYmxlIHRvCj4gPj4gcHJvdmUgdGhhdCB1c2luZyBaYXdycyBpcyBhIHdpbiB3aGVu
IHRlc3Rpbmcgb24gUUVNVSwgbm90IGV2ZW4gd2hlbgo+ID4+IG92ZXJzdWJzY3JpYmluZyBWQ1BV
cyB0byBndWVzdHMuIEhvd2V2ZXIsIGl0IGlzIHBvc3NpYmxlIHRvIHVzZSBLVk0KPiA+PiBzZWxm
dGVzdHMgdG8gZm9yY2UgYSBzY2VuYXJpbyB3aGVyZSB3ZSBjYW4gcHJvdmUgWmF3cnMgZG9lcyBp
dHMgam9iIGFuZAo+ID4+IGRvZXMgaXQgd2VsbC4gWzRdIGlzIGEgdGVzdCB3aGljaCBkb2VzIHRo
aXMgYW5kLCBvbiBteSBtYWNoaW5lLCB3aXRob3V0Cj4gPj4gWmF3cnMgaXQgdGFrZXMgMTYgc2Vj
b25kcyB0byBjb21wbGV0ZSBhbmQgd2l0aCBaYXdycyBpdCB0YWtlcyAwLjI1Cj4gPj4gc2Vjb25k
cy4KPiA+Pgo+ID4+IFRoaXMgc2VyaWVzIGlzIGFsc28gYXZhaWxhYmxlIGhlcmUgWzFdLiBJbiBv
cmRlciB0byB1c2UgUUVNVSBmb3IgdGVzdGluZwo+ID4+IGEgYnVpbGQgd2l0aCBbMl0gaXMgbmVl
ZGVkLiBJbiBvcmRlciB0byBlbmFibGUgZ3Vlc3RzIHRvIHVzZSBaYXdycyB3aXRoCj4gPj4gS1ZN
IHVzaW5nIGt2bXRvb2wsIHRoZSBicmFuY2ggYXQgWzNdIG1heSBiZSB1c2VkLgo+ID4+Cj4gPj4g
WzFdIGh0dHBzOi8vZ2l0aHViLmNvbS9qb25lcy1kcmV3L2xpbnV4L2NvbW1pdHMvcmlzY3YvemF3
cnMtdjMvCj4gPj4gWzJdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI0MDMxMjE1Mjkw
MS41MTIwMDEtMi1ham9uZXNAdmVudGFuYW1pY3JvLmNvbS8KPiA+PiBbM10gaHR0cHM6Ly9naXRo
dWIuY29tL2pvbmVzLWRyZXcva3ZtdG9vbC9jb21taXRzL3Jpc2N2L3phd3JzLwo+ID4+IFs0XSBo
dHRwczovL2dpdGh1Yi5jb20vam9uZXMtZHJldy9saW51eC9jb21taXQvY2IyYmVjY2ViY2VjZTEw
ODgxZGI4NDJlZDY5YmRkNTcxNWNmYWI1ZAo+ID4+Cj4gPj4gVGhhbmtzLAo+ID4+IGRyZXcKPiA+
Pgo+ID4+IHYzOgo+ID4+ICAtIE1vdmVkIGNvbW1lbnQgYWJvdXQgZXhwZWN0ZWQgdGVybWluYXRp
b24gZnJvbSB0aGUgRFQgYmluZGluZyB0ZXh0Cj4gPj4gICAgdG8gYSBjb2RlIGNvbW1lbnQuCj4g
Pj4KPiA+PiB2MjoKPiA+PiAgLSBBZGRlZCBEVCBiaW5kaW5ncyBwYXRjaCB3aXRoIGFkZGl0aW9u
YWwgTGludXggc3BlY2lmaWNhdGlvbnMgZHVlCj4gPj4gICAgdG8gd3JzLm50byBwb3RlbnRpYWxs
eSBuZXZlciB0ZXJtaW5hdGluZywgYXMgc3VnZ2VzdGVkIGJ5IFBhbG1lcgo+ID4+ICAtIEFkZGVk
IHBhdGNoIHRvIHNoYXJlIHBhdXNlIGluc24gZGVmaW5pdGlvbgo+ID4+ICAtIFJld29yayBtYWlu
IFphd3JzIHN1cHBvcnQgcGF0Y2ggdG8gdXNlIEFybSBhcHByb2FjaCAod2hpY2ggaXMKPiA+PiAg
ICBhbHNvIHRoZSBhcHByb2FjaCB0aGF0IEFuZHJlYSBQYXJyaSBzdWdnZXN0ZWQpCj4gPj4gIC0g
RHJvcHBlZCB0aGUgcmlzY3YgaW1wbGVtZW50YXRpb24gb2Ygc21wX2NvbmRfbG9hZF9hY3F1aXJl
KCkuCj4gPj4gICAgYWZhaWN0LCB0aGUgZ2VuZXJpYyBpbXBsZW1lbnRhdGlvbiwgd2hpY2ggd2ls
bCB1c2UgdGhlIHJpc2N2Cj4gPj4gICAgaW1wbGVtZW50YXRpb24gb2Ygc21wX2NvbmRfbG9hZF9y
ZWxheGVkKCkgaXMgc3VmZmljaWVudCBmb3IgcmlzY3YuCj4gPj4gIC0gVGhlIHJld29yayB3YXMg
bGFyZ2UgZW5vdWdoIChJTU8pIHRvIGRyb3AgSGVpa28ncyBzLW8tYiBhbmQgdG8KPiA+PiAgICBh
ZGQgbXlzZWxmIGFzIGEgY28tZGV2ZWxvcGVyCj4gPj4KPiA+Pgo+ID4+IEFuZHJldyBKb25lcyAo
NSk6Cj4gPj4gICByaXNjdjogUHJvdmlkZSBhIGRlZmluaXRpb24gZm9yICdwYXVzZScKPiA+PiAg
IGR0LWJpbmRpbmdzOiByaXNjdjogQWRkIFphd3JzIElTQSBleHRlbnNpb24gZGVzY3JpcHRpb24K
PiA+PiAgIHJpc2N2OiBod3Byb2JlOiBleHBvcnQgWmF3cnMgSVNBIGV4dGVuc2lvbgo+ID4+ICAg
S1ZNOiByaXNjdjogU3VwcG9ydCBndWVzdCB3cnMubnRvCj4gPj4gICBLVk06IHJpc2N2OiBzZWxm
dGVzdHM6IEFkZCBaYXdycyBleHRlbnNpb24gdG8gZ2V0LXJlZy1saXN0IHRlc3QKPiA+Pgo+ID4+
IENocmlzdG9waCBNPz9sbG5lciAoMSk6Cj4gPj4gICByaXNjdjogQWRkIFphd3JzIHN1cHBvcnQg
Zm9yIHNwaW5sb2Nrcwo+ID4+Cj4gPj4gIERvY3VtZW50YXRpb24vYXJjaC9yaXNjdi9od3Byb2Jl
LnJzdCAgICAgICAgICB8ICA0ICsrCj4gPj4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2
L2V4dGVuc2lvbnMueWFtbCB8ICA3ICsrKwo+ID4+ICBhcmNoL3Jpc2N2L0tjb25maWcgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgfCAyMCArKysrLS0tCj4gPj4gIGFyY2gvcmlzY3YvTWFrZWZp
bGUgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAzIC0KPiA+PiAgYXJjaC9yaXNjdi9pbmNs
dWRlL2FzbS9iYXJyaWVyLmggICAgICAgICAgICAgIHwgNDUgKysrKysrKysrLS0tLS0KPiA+PiAg
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jbXB4Y2hnLmggICAgICAgICAgICAgIHwgNTggKysrKysr
KysrKysrKysrKysrKwo+ID4+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmggICAgICAg
ICAgICAgICAgfCAgMSArCj4gPj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vaW5zbi1kZWYuaCAg
ICAgICAgICAgICB8ICA0ICsrCj4gPj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX2hvc3Qu
aCAgICAgICAgICAgICB8ICAxICsKPiA+PiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS92ZHNvL3By
b2Nlc3Nvci5oICAgICAgIHwgIDggKy0tCj4gPj4gIGFyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2Fz
bS9od3Byb2JlLmggICAgICAgICB8ICAxICsKPiA+PiAgYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkv
YXNtL2t2bS5oICAgICAgICAgICAgIHwgIDEgKwo+ID4+ICBhcmNoL3Jpc2N2L2tlcm5lbC9jcHVm
ZWF0dXJlLmMgICAgICAgICAgICAgICAgfCAgMSArCj4gPj4gIGFyY2gvcmlzY3Yva2VybmVsL3N5
c19od3Byb2JlLmMgICAgICAgICAgICAgICB8ICAxICsKPiA+PiAgYXJjaC9yaXNjdi9rdm0vdmNw
dS5jICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDEgKwo+ID4+ICBhcmNoL3Jpc2N2L2t2bS92
Y3B1X2luc24uYyAgICAgICAgICAgICAgICAgICAgfCAxNSArKysrKwo+ID4+ICBhcmNoL3Jpc2N2
L2t2bS92Y3B1X29uZXJlZy5jICAgICAgICAgICAgICAgICAgfCAgMiArCj4gPj4gIC4uLi9zZWxm
dGVzdHMva3ZtL3Jpc2N2L2dldC1yZWctbGlzdC5jICAgICAgICB8ICA0ICsrCj4gPj4gIDE4IGZp
bGVzIGNoYW5nZWQsIDE0NiBpbnNlcnRpb25zKCspLCAzMSBkZWxldGlvbnMoLSkKPiA+Pgo+ID4+
IC0tCj4gPj4gMi40NC4wCj4gPj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
