Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8802CD8CA9
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Oct 2023 17:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DdwvGrrfbdMJqb+ovrYpxd4sUqlhOzzVsranEnA1RmA=; b=Xg2wrmrwvJlCp7
	eyjHZuofdPf2kJAy7UYl3VOZnH1RDEjwB+bTrWzsfSdvrwmxGIDesM5YYkHZjs2UDScz2Cu3K6Lbn
	VBd3NUXHldjVkL5LmKZgfTW820bbDx/YlhkkOUd1iQBgboBGhbmUHzN3LHlmEsm5v2nx3CRxh6IvT
	ljk01C0LYUDHxr6nmvXPm0dLYI1AfoaK6Ilk7HG/rLBCLW6y6G4CzCJoGrhSV9irFEu1uJvQnLYF2
	Q3Pw2NMRxERv6S7k3aYTf5vGfnX+UuAFCPGWapdBjOwyz2E7RI2ASfV+x8dO3a3SkXaSmcgT5TIZK
	KxCPBm6vLTcuVWwiol8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqG9L-00Do9z-2p;
	Tue, 10 Oct 2023 17:04:03 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqG9I-00Do83-0Y
	for linux-riscv@lists.infradead.org;
	Tue, 10 Oct 2023 17:04:02 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-523100882f2so9663893a12.2
        for <linux-riscv@lists.infradead.org>; Tue, 10 Oct 2023 10:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1696957424; x=1697562224; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6RZDU95I8r//XKuMMA7eTDc3BvDMJv7nElt+572Qbag=;
        b=lDiBAWOARZNdsah0gS1p9196yYScwt8n0/Zgn590Hs2cR76RDeAWqrwe5tTLUZVDQJ
         kRMKxSzEA9/l1DgEZelcYcFjFCo5bn7oWDSVwNiObH1ZsZV/iTNG8Wi4iEi0mzGgQuN3
         E1Axcq/Jn7o5tc//xUZuVLndT30SB0cEWmUWppwds3tRPfvP44L+fn8B+l6yjv7qrGkZ
         aodFuGJgvJyvUYvpdZEuCSVhNhBa0Me7xOa1xF6B7WLgVwpj20PuG7G/32Sl/DiCCKKp
         /eD7K8+Y5w0KnIIwmlQACnGnHRGC9kVGM8j77uFUOyVFLESb71FMXetkeCiIRcstTiXY
         +L+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696957424; x=1697562224;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6RZDU95I8r//XKuMMA7eTDc3BvDMJv7nElt+572Qbag=;
        b=gBX96AAZwvZSwrC8dXCb2KlEe29OEAOingJuMgOaojHSNjrpM6jXTlP6RLTM5VyHjv
         Q+VSjSToctWr+D/LPzKqM+1SLNaoDzTMkcO+cRvZfhQ44KTQUsXUkGV4NFoxNKD0UJM4
         bNJ3a/ORHOqNZmin9Cygu/A6nji3SlMesKxjePLmBi7fFvJ+fbjOy8ZSqzrS3ILRYmVM
         SUu9sXjrPBQNGgl1X0Y8x9Ua9KZnfPnlYS34gAoegwO13DgaMYPepfqwjEX9+PGo7bcW
         2XPsUAoVawBj1E+sutTyV3Z9rJsG1Z4EqnI0kzfXzWgNQvlVeRAD+Q768xIYLYZz9Qbl
         4zmw==
X-Gm-Message-State: AOJu0Yzs77G6r+xDjnWyhAXQH/eVv+5JsPljC7BvlBPc0Ioy2bitK/t1
	dpkp0ctv6CzqmZ1wSgw8Ku+arw==
X-Google-Smtp-Source: AGHT+IHroG89+MaRNpBH/oeCTCFeT8XtKi16tkg9jMUMZsLmkgyfCZaJES4G0HiqQdzl+4tgQoyfmA==
X-Received: by 2002:a05:6402:1851:b0:530:ce4b:638d with SMTP id v17-20020a056402185100b00530ce4b638dmr18886463edy.1.1696957424586;
        Tue, 10 Oct 2023 10:03:44 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id bf14-20020a0564021a4e00b005362bcc089csm7702890edb.67.2023.10.10.10.03.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 10:03:44 -0700 (PDT)
Date: Tue, 10 Oct 2023 19:03:43 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, Evan Green <evan@rivosinc.com>, 
	Conor Dooley <conor.dooley@microchip.com>, xiao.w.wang@intel.com
Subject: Re: [PATCH v4 2/6] RISC-V: Enable cbo.zero in usermode
Message-ID: <20231010-442c4eec837dbab30e4c65ae@orel>
References: <20230918131518.56803-10-ajones@ventanamicro.com>
 <mhng-5a430e90-492e-4401-b7da-af0198a7d90c@palmer-ri-x1c9a>
 <CAK9=C2WdpsHoWvour0vwnCmG01qZiGq4-BQSLa25QdZ-2DJF0g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK9=C2WdpsHoWvour0vwnCmG01qZiGq4-BQSLa25QdZ-2DJF0g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231010_100400_214589_209B2AEC 
X-CRM114-Status: GOOD (  20.89  )
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

T24gVGh1LCBTZXAgMjEsIDIwMjMgYXQgMDc6NTI6MTBQTSArMDUzMCwgQW51cCBQYXRlbCB3cm90
ZToKPiBPbiBUaHUsIFNlcCAyMSwgMjAyMyBhdCA3OjAw4oCvUE0gUGFsbWVyIERhYmJlbHQgPHBh
bG1lckBkYWJiZWx0LmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24gTW9uLCAxOCBTZXAgMjAyMyAwNjox
NToyMSBQRFQgKC0wNzAwKSwgYWpvbmVzQHZlbnRhbmFtaWNyby5jb20gd3JvdGU6Ci4uLgo+ID4g
PiArdm9pZCByaXNjdl91c2VyX2lzYV9lbmFibGUodm9pZCkKPiA+ID4gK3sKPiA+ID4gKyAgICAg
aWYgKHJpc2N2X2NwdV9oYXNfZXh0ZW5zaW9uX3VubGlrZWx5KHNtcF9wcm9jZXNzb3JfaWQoKSwg
UklTQ1ZfSVNBX0VYVF9aSUNCT1opKQo+ID4gPiArICAgICAgICAgICAgIGNzcl9zZXQoQ1NSX1NF
TlZDRkcsIEVOVkNGR19DQlpFKTsKPiA+Cj4gPiBJdCBsb29rcyBsaWtlIENCWkUgZGlkbid0IGFj
dHVhbGx5IGdldCByYXRpZmllZD8gIFRoZSBDTU8gZXh0ZW5zaW9uIHNheXMKPiA+Cj4gPiAgICAg
X1RoZSBDTU8gZXh0ZW5zaW9ucyByZWx5IG9uIHN0YXRlIGluIHtjc3JuYW1lfSBDU1JzIHRoYXQg
d2lsbCBiZSBkZWZpbmVkIGluIGEKPiA+ICAgICBmdXR1cmUgdXBkYXRlIHRvIHRoZSBwcml2aWxl
Z2VkIGFyY2hpdGVjdHVyZS4gSWYgdGhpcyBDU1IgdXBkYXRlIGlzIG5vdAo+ID4gICAgIHJhdGlm
aWVkLCB0aGUgQ01PIGV4dGVuc2lvbiB3aWxsIGRlZmluZSBpdHMgb3duIENTUnMuXwo+ID4KPiA+
IGJ1dCB0aGUgcHJpdmlsZWdlZCBzcGVjIHNheXMKPiA+Cj4gPiAgICAgVGhlIGRlZmluaXRpb24g
b2YgdGhlIENCWkUgZmllbGQgd2lsbCBiZSBmdXJuaXNoZWQgYnkgdGhlIGZvcnRoY29taW5nCj4g
PiAgICAgWmljYm96IGV4dGVuc2lvbi4gSXRzIGFsbG9jYXRpb24gd2l0aGluIGBzZW52Y2ZnYCBt
YXkgY2hhbmdlIHByaW9yIHRvCj4gPiAgICAgdGhlIHJhdGlmaWNhdGlvbiBvZiB0aGF0IGV4dGVu
c2lvbi4KPiA+Cj4gPiBJcyB0aGVyZSBzb21lIHJhdGlmaWVkIHNwZWMgdGhhdCBhY3R1YWxseSBk
ZWZpbmVzIHRoaXM/Cj4gCj4gSSBzZWUgd2hhdCB5b3UgbWVhbi4gVGhlIGludGVncmF0aW9uIG9m
IHRoZXNlIGJpdHMgaW50byB0aGUgUklTQy1WCj4gcHJpdiBzcGVjIGhhcyBub3QgaGFwcGVuZWQg
aGVuY2Ugd2UgaGF2ZSB0aGUgbm9uLW5vcm1hdGl2ZSB0ZXh0Cj4gaW4gdGhlIENNTyBzcGVjaWZp
Y2F0aW9uLiBUaGUgYml0IHBvc2l0aW9ucyBpbiB4ZW52Y2ZnIENTUnMgY2FuJ3QKPiBjaGFuZ2Ug
YmVjYXVzZSBpdCdzIGFscmVhZHkgcGFydCBvZiByYXRpZmllZCBDTU8gc3BlY2lmaWNhdGlvbiBh
bmQKPiB0aGVyZSBhcmUgb3JnYW5pemF0aW9ucyAobGlrZSBWZW50YW5hKSB3aG8gaGF2ZSBpbXBs
ZW1lbnRlZCB0aGVzZQo+IGJpdHMuCj4gCgpIaSBQYWxtZXIsCgpEb2VzIEFudXAncyByZXNwb25z
ZSBzYXRpc2Z5IHRoZSBjcml0ZXJpYSBmb3IgdGhpcz8gSSdtIHdvbmRlcmluZyB3aGF0LCBpZgph
bnl0aGluZywgSSBzaG91bGQgZG8gd2l0aCB0aGlzIHNlcmllcy4gKFRoZSBod3Byb2JlLXdoaWNo
LWNwdXMgc2VyaWVzCmlzIGN1cnJlbnRseSBiYXNlZCBvbiB0aGlzIHNlcmllcywgYmVjYXVzZSBv
ZiB0aGUgaHdwcm9iZSBzZWxmdGVzdHMKY2hhbmdlcywgYnV0IEkgZ3Vlc3MgSSBjb3VsZCByZXdv
cmsgdGhhdC4pCgpUaGFua3MsCmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
