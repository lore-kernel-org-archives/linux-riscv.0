Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01031C52D7C
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Aug 2024 15:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/0GZ5PDv0oIVz23k1LPcLUU7XFqfN9cEWrxJ8B+8qrU=; b=f7LFg4XOXGVIUd
	BpMN93HaUZY2q+/Ed9/jAQ3jnhafXLBmT20yHQ77D5kwY25wGUa8SZJ2tJe/1Sx/tFAxbtNYAduQr
	Hr5cdyRtn5W44/FQ82PqzgtrW0V1QGHOirtVUZww75iYFzOde8fOtdizJnx3rtJk+TN7b/ujH/OIb
	anASRtcUxri5HfmwwWI9Zc4ijLIsVOn+pOqxIUUSU59/Ij3lYkhtBvBn0Gp4Yu/UqU+OkLYGsvfVR
	vsOSth7xZce50poeR/Id2MzYoYXPRf1OIJo/HerilCrePOtF33oZqyVciGRuyIiiPSlKUIpnP/55W
	ghQoipKoO9BckvhkxFEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sectA-0000000ARvO-0CL3;
	Thu, 15 Aug 2024 15:59:48 +0000
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sect2-0000000ARtB-0F7c
	for linux-riscv@lists.infradead.org;
	Thu, 15 Aug 2024 15:59:45 +0000
Received: by mail-io1-xd29.google.com with SMTP id ca18e2360f4ac-81f86fd93acso39307139f.1
        for <linux-riscv@lists.infradead.org>; Thu, 15 Aug 2024 08:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1723737579; x=1724342379; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g4+z91zLwzol+brq2IIPZq1Ohh/pu+6NsMuoxH1a358=;
        b=Nouvh1F7Vw83BFQf75omdZ0BlHoQNv80azbRxPhEEv0JGsOZcBEnB0TygM0z5wRC9I
         3c9ixvdcjHrEHNpqROrIb8pGYozADBq09r9GZp8Jcwnw0HddJ89P5HtMehzMQPr+E3L2
         EyjWvLuqjQPvxcQnXmUFDsjGKmxQWmLsD6f98N+1hp/fyDElDQ/cE6Gf3VFjGV/GhN2R
         nzZknx/PGeeTpDmw0fNsYR/EharUXakPvuZajfuik7lImxB28/YTlM71VIcIIuj/fSi3
         +ArbX658wl/BTehnlvLxRFijddopbrOtss/Hny53TEK5wf3331QLJbpNZM5RTKtEhL6P
         gcBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723737579; x=1724342379;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g4+z91zLwzol+brq2IIPZq1Ohh/pu+6NsMuoxH1a358=;
        b=B/kfd+TwqJ+9JBW0+QTcWASzhuhjj590QyF80KRFphj0saB+5GIHFhrz6Yz8n1RaIf
         18FH7iB6DvTvnifswQtLxy9amVyfZM0pburhyfm+qCVP5fzrhLYTGQ1mUI/0uw9t/ief
         bEuNv5Mpwg2CWcnYCZ0eBooDKn7+zZvxBBr/xNXZtUDnzpJszgOZocBV3r2r/u3Yu/zs
         mBh/HU4N47t4ShTW5p4MVCWfOWBscx1xCWJqNVIeIDL75xwpyPi56s0EvK9ED+/7mbxp
         AtGDEzawlap/3K2Mqgr5DJ+uMnTFpciWJSSiT+FH3RRHWqHE0xWGUJhGtr21pNPwSv0X
         3UBA==
X-Forwarded-Encrypted: i=1; AJvYcCUe21l8Hi24s8f7XfbiMEfXbA2IITMFCW5/R9rmJNIIEFrP/dC6pg4lt/VShPgjvslvapVSVbQ0SZSqxiVdgIt7VCJ/ST5jCCitX+yI3TTN
X-Gm-Message-State: AOJu0Yw005Cf+XM2OAyZpAGxKgiRCq6MIKfkFGatFTWWnrsiertkxkxi
	AF9KDniSn4a3mj5i+5YDF9QKMkzRXMIVrwhsmjhwM04SBF3bNK1vQgSgfDASYYA=
X-Google-Smtp-Source: AGHT+IFNOb+TtVyiLhjQXNipwoGI8CZl3XTIEhqlZdMaV4HQw3tSJmyEeEAIBgFrQISH3pvXP4F29g==
X-Received: by 2002:a5e:df02:0:b0:81f:8825:af8f with SMTP id ca18e2360f4ac-824e76b222cmr271498539f.2.1723737579038;
        Thu, 15 Aug 2024 08:59:39 -0700 (PDT)
Received: from [100.64.0.1] ([147.124.94.167])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-824e990d5b4sm57205339f.14.2024.08.15.08.59.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Aug 2024 08:59:38 -0700 (PDT)
Message-ID: <085c8332-d7f1-41df-8854-bee06291ba83@sifive.com>
Date: Thu, 15 Aug 2024 10:59:37 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/9] Fix Allwinner D1 boot regression
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Anup Patel <apatel@ventanamicro.com>, Thomas Gleixner <tglx@linutronix.de>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Daniel Lezcano <daniel.lezcano@linaro.org>
References: <20240814145642.344485-1-emil.renner.berthing@canonical.com>
 <87jzgjnh9z.ffs@tglx>
 <CAJM55Z8WERQgs=QMyFGWvAHOpwcnOAudBqovaEuDudPSXCvL5Q@mail.gmail.com>
 <87ttfmm2ns.ffs@tglx>
 <CAJM55Z88H635Crc-Aeq+K0qcAk7NC89WVTAFdXDd2aQKQ7QmEg@mail.gmail.com>
 <CAJM55Z_qQX7n8tAeOFqrAH1BFjA9vaWA8rtsPG2BcKmiO88m=Q@mail.gmail.com>
 <87plqalyd4.ffs@tglx> <686d61c4-e7ac-4dca-a7fd-decdd72e84d9@sifive.com>
 <87h6blnaf1.ffs@tglx>
 <CAK9=C2V7oL023=u6nodJs76k_0yHZ8PTJs=n1QFqDWCcCnG9kw@mail.gmail.com>
 <be1db8f5-af55-48a4-be7a-5e8a1a5e25c4@sifive.com>
 <CAJM55Z9kKqs-kMubsGsRkS6E2Y4ur1MmwD+1XFvGP=UVNrJvRg@mail.gmail.com>
Content-Language: en-US
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <CAJM55Z9kKqs-kMubsGsRkS6E2Y4ur1MmwD+1XFvGP=UVNrJvRg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240815_085940_297625_D3D5F8B4 
X-CRM114-Status: GOOD (  19.27  )
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

SGkgRW1pbCwKCk9uIDIwMjQtMDgtMTUgMTA6MDcgQU0sIEVtaWwgUmVubmVyIEJlcnRoaW5nIHdy
b3RlOgo+IFNhbXVlbCBIb2xsYW5kIHdyb3RlOgo+PiBPbiAyMDI0LTA4LTE1IDk6MTYgQU0sIEFu
dXAgUGF0ZWwgd3JvdGU6Cj4+PiBPbiBUaHUsIEF1ZyAxNSwgMjAyNCBhdCA3OjQx4oCvUE0gVGhv
bWFzIEdsZWl4bmVyIDx0Z2x4QGxpbnV0cm9uaXguZGU+IHdyb3RlOgo+Pj4+Cj4+Pj4gT24gVGh1
LCBBdWcgMTUgMjAyNCBhdCAwODozMiwgU2FtdWVsIEhvbGxhbmQgd3JvdGU6Cj4+Pj4+IE9uIDIw
MjQtMDgtMTUgODoxNiBBTSwgVGhvbWFzIEdsZWl4bmVyIHdyb3RlOgo+Pj4+Pj4gWWVzLiBTbyB0
aGUgcmlzY3YgdGltZXIgaXMgbm90IHdvcmtpbmcgb24gdGhpcyB0aGluZyBvciBpdCBzdG9wcwo+
Pj4+Pj4gc29tZWhvdy4KPj4+Pj4KPj4+Pj4gVGhhdCdzIGNvcnJlY3QuIFdpdGggdGhlIChmaXJt
d2FyZSkgZGV2aWNldHJlZSB0aGF0IEVtaWwgaXMgdXNpbmcsIHRoZSBPcGVuU0JJCj4+Pj4+IGZp
cm13YXJlIGRvZXMgbm90IGhhdmUgYSB0aW1lciBkZXZpY2UsIHNvIGl0IGRvZXMgbm90IGV4cG9z
ZSB0aGUgKG9wdGlvbmFsWzFdKQo+Pj4+PiBTQkkgdGltZSBleHRlbnNpb24sIGFuZCBzYmlfc2V0
X3RpbWVyKCkgZG9lcyBub3RoaW5nLgo+Pj4+Cj4+Pj4gU2lnaC4gRG9lcyBSSVNDViByZWFsbHkg
aGF2ZSB0byByZXBlYXQgYWxsIG1pc3Rha2VzIHdoaWNoIGhhdmUgYmVlbiBtYWRlCj4+Pj4gYnkg
eDg2LCBBUk0gYW5kIG90aGVycyBiZWZvcmU/IEl0J3Mga25vd24gZm9yIGRlY2FkZXMgdGhhdCB0
aGUga2VybmVsCj4+Pj4gcmVsaWVzIG9uIGEgd29ya2luZyB0aW1lci4uLgo+Pj4KPj4+IE15IGFw
b2xvZ2llcyBmb3IgdGhlIGRlbGF5IGluIGZpbmRpbmcgYSBmaXggZm9yIHRoaXMgaXNzdWUuCj4+
Pgo+Pj4gQWxtb3N0IGFsbCBSSVNDLVYgcGxhdGZvcm1zIChleGNlcHQgdGhpcyBvbmUpIGhhdmUg
U0JJIFRpbWVyIGFsd2F5cwo+Pj4gYXZhaWxhYmxlIGFuZCBMaW51eCB1c2VzIGEgYmV0dGVyIHRp
bWVyIG9yIFNzdGMgZXh0ZW5zaW9uIHdoZW5ldmVyCj4+PiBpdCBpcyBhdmFpbGFibGUuCj4+Cj4+
IFNvIHRoaXMgaXMgdGhlIGltbWVkaWF0ZSBzb2x1dGlvbjogYWRkIHRoZSBDTElOVCB0byB0aGUg
ZmlybXdhcmUgZGV2aWNldHJlZSBzbwo+PiB0aGF0IHRoZSBTQkkgdGltZSBleHRlbnNpb24gd29y
a3MsIGFuZCBMaW51eCB3aWxsIGJvb3Qgd2l0aG91dCBhbnkgY29kZSBjaGFuZ2VzLAo+PiBhbGJl
aXQgd2l0aCBhIGhpZ2hlci1vdmVyaGVhZCBjbG9ja2V2ZW50IGRldmljZS4KPiAKPiBCdXQgdGhp
cyB3aWxsIG1lYW4gdGhhdCB5b3UgY2FuJ3QgdXBkYXRlIHlvdXIga2VybmVsIHRvIHY2Ljkgb3Ig
bmV3ZXIgd2l0aG91dAo+IHJlZmxhc2hpbmcgT3BlblNCSSBhbmQgdS1ib290LiBUaGF0J3Mgc3Rp
bGwgYSByZWdyZXNzaW9uIHJpZ2h0PwoKSSBzdXBwb3NlIHRoYXQgZGVwZW5kcyBvbiBpZiB5b3Ug
dGhpbmsgdGhlIFNCSSB0aW1lIGV4dGVuc2lvbiBpcyAob3Igc2hvdWxkIGhhdmUKYmVlbikgbWFu
ZGF0b3J5IGZvciBwbGF0Zm9ybXMgd2l0aG91dCBTc3RjLiBJZiB0aGUgU0JJIHRpbWUgZXh0ZW5z
aW9uIGlzCm1hbmRhdG9yeSwgdGhlbiB0aGlzIGlzIGEgZmlybXdhcmUgYnVnLCBhbmQgbm90IHJl
YWxseSBMaW51eCdzIHJlc3BvbnNpYmlsaXR5IHRvCndvcmsgYXJvdW5kLgoKSWYgdGhlIFNCSSB0
aW1lIGV4dGVuc2lvbiBpcyBub3QgbWFuZGF0b3J5LCB0aGVuIExpbnV4IG5lZWRzIHRvIGJlIGFi
bGUgdG8KaGFuZGxlIHBsYXRmb3JtcyB3aGVyZSB0aGUgUy1tb2RlIHZpc2libGUgdGltZXIgaXMg
YXR0YWNoZWQgdG8gYW4gZXh0ZXJuYWwKaW50ZXJydXB0IGNvbnRyb2xsZXIgKFBMSUMgb3IgQVBM
SUMpLCBzbyB0aGUgaXJxY2hpcCBkcml2ZXIgbmVlZHMgdG8gYmUgbG9hZGVkCmJlZm9yZSB0aW1l
X2luaXQoKSAodGltZXJfcHJvYmUoKSkuIFNvIGluIHRoYXQgY2FzZSwgdGhlIGJ1ZyBpcyBhIExp
bnV4CnJlZ3Jlc3Npb24sIGFuZCB3ZSB3b3VsZCBuZWVkIHRvIHJldmVydCB0aGUgcGxhdGZvcm0g
ZHJpdmVyIGNvbnZlcnNpb24uCgpSZWdhcmRzLApTYW11ZWwKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
