Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 776A0E7718B
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Dec 2024 01:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OOmOPuQVLpPmaV0Nkv3yEz39TNJRAhqKRKEu6h4gdCQ=; b=4QoErFTxBFrcJJ
	cbIq6BXPZ3zV18l/xec0f84iVLIDVodCAqWNcmzaBQy2kJ3C5e3FDraOGc7tCaLOWlA0QqaaFCmhd
	7GIiuL7HQYEFNotqM8uF9UT9lh4pQ86fHE+8yFajRSi2j2QdK61syuqU4YY5P8Ft1i8Uhx5vb7ZY2
	LBn3uF3worPkOULz+WCXnYK0vIwea142Rx1wbYyYoiNHa/QQDMXbyiCdEzXykK4ywT8FuIzlo0iZf
	MpatU23fDzDWysphXnZZCmt2wU4z27Ib6SHdTMG600X56xe3QbHYrzni9+o8Zme95j2q3XTQdWzdZ
	flZPoKmKhm8PJ1TdEvLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPtj1-0000000B0QM-3MJw;
	Tue, 24 Dec 2024 01:28:43 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPtiy-0000000B0PO-2eR4
	for linux-riscv@lists.infradead.org;
	Tue, 24 Dec 2024 01:28:42 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-21654fdd5daso44895285ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 23 Dec 2024 17:28:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1735003719; x=1735608519; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2r+hHGrSfGWRzOt3YPjDLu8rBH3ivYL9UjShvm3+Rt0=;
        b=RMQcxvVIBfZ6tA7l+ExwuKVfsFlyHgD1pp/ZjSMSTz/CESmlGB5iXTmZtvzEqnkRjB
         QntpP1OmEcw9pfAhCIZr00nZ56kW8PBOvV1xFj55HflYkYi/KzQZ+uVcEVlH4Khn56Jc
         WowyL/oLWBFAruO+2D/tfv1ygjGQ5SBsMWQY7ENyekidYlzm/t/I+5/TgogLFZZ0bjBq
         2mL98YENvqP3hw2jxiAbJS38eRfydzlFEkey0iXBb6QH7XjmrYpKv6I5cGzVMuxz9Cfk
         R4rI4bk7l8A8oyANoIRJ9gpHTvxOAI+9qoZ+aQGhrW9T1YS3Pt9ebeTTorReigHdmT4Z
         28cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735003719; x=1735608519;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2r+hHGrSfGWRzOt3YPjDLu8rBH3ivYL9UjShvm3+Rt0=;
        b=a9Ggb//NOsndUW4lCfIS7l3qzpPCwQ8vpYVGLq/1tiA9hAVnAydKRhNzSvtl+hrXZn
         LbefGlCFJKRd2f1/nMyreYHrvQCfzq1naRpEANeDOv55HsbBDj89en4ONEwGzsVD7ide
         hGRU/deTzp5kkEGCdhqSw8SsOu2EChzWi6rAnBJzks6OpotBSBDYQywqOav8lE6SFVNV
         GKwOuU96peN1J2SQ9h65IRM2uWvJO6MwlBiouwtFCBgRQiZXQNp6TlvCZAKJcXJAtLDY
         +jiFa870GivqZvdgloIwqy/OGfkSzXsitnxnSwRJ3fucReJBt5NO96yc4e1zyhpdYv6H
         SnFw==
X-Forwarded-Encrypted: i=1; AJvYcCU/GF71bHIsdJCHvcJzQclnJb6MaQGsd4JTQjVVm+YL8jSwrLd22Nhq9nRqIH+doYY9Evh8E8FcezZ1xg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwB/gIetKqH6cNvg+1qiYz7w5FFoaV0486iW/mFERbeOD75htMw
	7RF5it7D4/RKXWWmRg9hv+OmfjL4h924XI8nhle2vGWYgt3GFeTNJMiho38cz/e8Ve/IE3iE+jw
	6AfYGe8/folqhWX72W5PrfpDaR47efbGkiBMFbA==
X-Gm-Gg: ASbGncvvG05/S31fSPWorCflgDbNKdrp+o8flpgz0VYP0mzYi0/0LFWI524tJqeG8af
	iLiy8S5BLpCF26lpbvZbkv6a7J/iOnwbb0rIE
X-Google-Smtp-Source: AGHT+IHLJmmH3jU1z3Dd3seWuqBfKE6BX7c1oHTHNFkQnpmnsGeKrQO4Ilp3RElE8malUlH4CKZqcLevVysoRCQfJCc=
X-Received: by 2002:a05:6a00:849:b0:725:c8ea:b30b with SMTP id
 d2e1a72fcca58-72abddbe6c8mr15634452b3a.11.1735003718866; Mon, 23 Dec 2024
 17:28:38 -0800 (PST)
MIME-Version: 1.0
References: <20241212-kvm_guest_stat-v1-0-d1a6d0c862d5@rivosinc.com>
 <20241212-kvm_guest_stat-v1-3-d1a6d0c862d5@rivosinc.com> <CAAhSdy24K3pkOR25Rbcvw6pRWXrKXdy0CH9CLeG77EqQRZTDnQ@mail.gmail.com>
In-Reply-To: <CAAhSdy24K3pkOR25Rbcvw6pRWXrKXdy0CH9CLeG77EqQRZTDnQ@mail.gmail.com>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Mon, 23 Dec 2024 17:28:28 -0800
Message-ID: <CAHBxVyH3eX0o66398+L09RKriudDC90M_7wzsRrQZ+42f4JOVQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] RISC-V: KVM: Add new exit statstics for redirected traps
To: Anup Patel <anup@brainfault.org>
Cc: Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_172840_882270_9D97A49D 
X-CRM114-Status: GOOD (  21.15  )
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

T24gTW9uLCBEZWMgMjMsIDIwMjQgYXQgNjoxOeKAr0FNIEFudXAgUGF0ZWwgPGFudXBAYnJhaW5m
YXVsdC5vcmc+IHdyb3RlOgo+Cj4gT24gRnJpLCBEZWMgMTMsIDIwMjQgYXQgMjoyN+KAr0FNIEF0
aXNoIFBhdHJhIDxhdGlzaHBAcml2b3NpbmMuY29tPiB3cm90ZToKPiA+Cj4gPiBDdXJyZW50bHks
IGt2bSBkb2Vzbid0IGRlbGVnYXRlIHRoZSBmZXcgdHJhcHMgc3VjaCBhcyBtaXNhbGlnbmVkCj4g
PiBsb2FkL3N0b3JlLCBpbGxlZ2FsIGluc3RydWN0aW9uIGFuZCBsb2FkL3N0b3JlIGFjY2VzcyBm
YXVsdHMgYmVjYXVzZSBpdAo+ID4gaXMgbm90IGV4cGVjdGVkIHRvIG9jY3VyIGluIHRoZSBndWVz
dCB2ZXJ5IGZyZXF1ZW50LiBUaHVzLCBrdm0gZ2V0cyBhCj4gPiBjaGFuY2UgdG8gYWN0IHVwb24g
aXQgb3IgY29sbGVjdCBzdGF0c3RpY3MgYWJvdXQgaXQgYmVmb3JlIHJlZGlyZWN0aW5nCj4gPiB0
aGUgdHJhcHMgdG8gdGhlIGd1ZXN0Lgo+ID4KPiA+IFdlIGNhbiBjb2xsZWN0IGJvdGggZ3Vlc3Qg
YW5kIGhvc3QgdmlzaWJsZSBzdGF0aXN0aWNzIGR1cmluZyB0aGUgdHJhcHMuCj4gPiBFbmFibGUg
dGhlbSBzbyB0aGF0IGJvdGggZ3Vlc3QgYW5kIGhvc3QgY2FuIGNvbGxlY3QgdGhlIHN0YXRzIGFi
b3V0Cj4gPiB0aGVtIGlmIHJlcXVpcmVkLgo+Cj4gcy9XZSBjYW4gY29sbGVjdCAuLi4vQ29sbGVj
dCAuLi4vCj4KCkxldCBtZSBrbm93IGlmIEkgc2hvdWxkIHNlbmQgYSB2Mi4gSSBub3RpY2VkIGEg
Y291cGxlIG9mIG90aGVyIHR5cG9zCmluIHRoZSBjb21taXQgdGV4dCBhcyB3ZWxsLgoKPiA+Cj4g
PiBTaWduZWQtb2ZmLWJ5OiBBdGlzaCBQYXRyYSA8YXRpc2hwQHJpdm9zaW5jLmNvbT4KPgo+IE90
aGVyd2lzZSwgaXQgbG9va3MgZ29vZCB0byBtZS4KPgo+IFJldmlld2VkLWJ5OiBBbnVwIFBhdGVs
IDxhbnVwQGJyYWluZmF1bHQub3JnPgo+Cj4gUmVnYXJkcywKPiBBbnVwCj4KPiA+IC0tLQo+ID4g
IGFyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX2hvc3QuaCB8IDUgKysrKysKPiA+ICBhcmNoL3Jp
c2N2L2t2bS92Y3B1LmMgICAgICAgICAgICAgfCA3ICsrKysrKy0KPiA+ICBhcmNoL3Jpc2N2L2t2
bS92Y3B1X2V4aXQuYyAgICAgICAgfCA1ICsrKysrCj4gPiAgMyBmaWxlcyBjaGFuZ2VkLCAxNiBp
bnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlz
Y3YvaW5jbHVkZS9hc20va3ZtX2hvc3QuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX2hv
c3QuaAo+ID4gaW5kZXggMzVlYWI2ZTBmNGFlLi5jYzMzZTM1Y2Q2MjggMTAwNjQ0Cj4gPiAtLS0g
YS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV9ob3N0LmgKPiA+ICsrKyBiL2FyY2gvcmlzY3Yv
aW5jbHVkZS9hc20va3ZtX2hvc3QuaAo+ID4gQEAgLTg3LDYgKzg3LDExIEBAIHN0cnVjdCBrdm1f
dmNwdV9zdGF0IHsKPiA+ICAgICAgICAgdTY0IGNzcl9leGl0X2tlcm5lbDsKPiA+ICAgICAgICAg
dTY0IHNpZ25hbF9leGl0czsKPiA+ICAgICAgICAgdTY0IGV4aXRzOwo+ID4gKyAgICAgICB1NjQg
aW5zdHJfaWxsZWdhbF9leGl0czsKPiA+ICsgICAgICAgdTY0IGxvYWRfbWlzYWxpZ25lZF9leGl0
czsKPiA+ICsgICAgICAgdTY0IHN0b3JlX21pc2FsaWduZWRfZXhpdHM7Cj4gPiArICAgICAgIHU2
NCBsb2FkX2FjY2Vzc19leGl0czsKPiA+ICsgICAgICAgdTY0IHN0b3JlX2FjY2Vzc19leGl0czsK
PiA+ICB9Owo+ID4KPiA+ICBzdHJ1Y3Qga3ZtX2FyY2hfbWVtb3J5X3Nsb3Qgewo+ID4gZGlmZiAt
LWdpdCBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHUuYyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHUuYwo+ID4g
aW5kZXggZTA0OGRjYzZlNjVlLi42MGQ2ODRjNzZjNTggMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3Jp
c2N2L2t2bS92Y3B1LmMKPiA+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHUuYwo+ID4gQEAgLTM0
LDcgKzM0LDEyIEBAIGNvbnN0IHN0cnVjdCBfa3ZtX3N0YXRzX2Rlc2Mga3ZtX3ZjcHVfc3RhdHNf
ZGVzY1tdID0gewo+ID4gICAgICAgICBTVEFUU19ERVNDX0NPVU5URVIoVkNQVSwgY3NyX2V4aXRf
dXNlciksCj4gPiAgICAgICAgIFNUQVRTX0RFU0NfQ09VTlRFUihWQ1BVLCBjc3JfZXhpdF9rZXJu
ZWwpLAo+ID4gICAgICAgICBTVEFUU19ERVNDX0NPVU5URVIoVkNQVSwgc2lnbmFsX2V4aXRzKSwK
PiA+IC0gICAgICAgU1RBVFNfREVTQ19DT1VOVEVSKFZDUFUsIGV4aXRzKQo+ID4gKyAgICAgICBT
VEFUU19ERVNDX0NPVU5URVIoVkNQVSwgZXhpdHMpLAo+ID4gKyAgICAgICBTVEFUU19ERVNDX0NP
VU5URVIoVkNQVSwgaW5zdHJfaWxsZWdhbF9leGl0cyksCj4gPiArICAgICAgIFNUQVRTX0RFU0Nf
Q09VTlRFUihWQ1BVLCBsb2FkX21pc2FsaWduZWRfZXhpdHMpLAo+ID4gKyAgICAgICBTVEFUU19E
RVNDX0NPVU5URVIoVkNQVSwgc3RvcmVfbWlzYWxpZ25lZF9leGl0cyksCj4gPiArICAgICAgIFNU
QVRTX0RFU0NfQ09VTlRFUihWQ1BVLCBsb2FkX2FjY2Vzc19leGl0cyksCj4gPiArICAgICAgIFNU
QVRTX0RFU0NfQ09VTlRFUihWQ1BVLCBzdG9yZV9hY2Nlc3NfZXhpdHMpLAo+ID4gIH07Cj4gPgo+
ID4gIGNvbnN0IHN0cnVjdCBrdm1fc3RhdHNfaGVhZGVyIGt2bV92Y3B1X3N0YXRzX2hlYWRlciA9
IHsKPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS92Y3B1X2V4aXQuYyBiL2FyY2gvcmlz
Y3Yva3ZtL3ZjcHVfZXhpdC5jCj4gPiBpbmRleCBhY2RjZDYxOTc5N2UuLjZlMGMxODQxMjc5NSAx
MDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfZXhpdC5jCj4gPiArKysgYi9hcmNo
L3Jpc2N2L2t2bS92Y3B1X2V4aXQuYwo+ID4gQEAgLTE5NSwyMiArMTk1LDI3IEBAIGludCBrdm1f
cmlzY3ZfdmNwdV9leGl0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgc3RydWN0IGt2bV9ydW4gKnJ1
biwKPiA+ICAgICAgICAgc3dpdGNoICh0cmFwLT5zY2F1c2UpIHsKPiA+ICAgICAgICAgY2FzZSBF
WENfSU5TVF9JTExFR0FMOgo+ID4gICAgICAgICAgICAgICAgIGt2bV9yaXNjdl92Y3B1X3BtdV9p
bmNyX2Z3KHZjcHUsIFNCSV9QTVVfRldfSUxMRUdBTF9JTlNOKTsKPiA+ICsgICAgICAgICAgICAg
ICB2Y3B1LT5zdGF0Lmluc3RyX2lsbGVnYWxfZXhpdHMrKzsKPiA+ICAgICAgICAgICAgICAgICBy
ZXQgPSB2Y3B1X3JlZGlyZWN0KHZjcHUsIHRyYXApOwo+ID4gICAgICAgICAgICAgICAgIGJyZWFr
Owo+ID4gICAgICAgICBjYXNlIEVYQ19MT0FEX01JU0FMSUdORUQ6Cj4gPiAgICAgICAgICAgICAg
ICAga3ZtX3Jpc2N2X3ZjcHVfcG11X2luY3JfZncodmNwdSwgU0JJX1BNVV9GV19NSVNBTElHTkVE
X0xPQUQpOwo+ID4gKyAgICAgICAgICAgICAgIHZjcHUtPnN0YXQubG9hZF9taXNhbGlnbmVkX2V4
aXRzKys7Cj4gPiAgICAgICAgICAgICAgICAgcmV0ID0gdmNwdV9yZWRpcmVjdCh2Y3B1LCB0cmFw
KTsKPiA+ICAgICAgICAgICAgICAgICBicmVhazsKPiA+ICAgICAgICAgY2FzZSBFWENfU1RPUkVf
TUlTQUxJR05FRDoKPiA+ICAgICAgICAgICAgICAgICBrdm1fcmlzY3ZfdmNwdV9wbXVfaW5jcl9m
dyh2Y3B1LCBTQklfUE1VX0ZXX01JU0FMSUdORURfU1RPUkUpOwo+ID4gKyAgICAgICAgICAgICAg
IHZjcHUtPnN0YXQuc3RvcmVfbWlzYWxpZ25lZF9leGl0cysrOwo+ID4gICAgICAgICAgICAgICAg
IHJldCA9IHZjcHVfcmVkaXJlY3QodmNwdSwgdHJhcCk7Cj4gPiAgICAgICAgICAgICAgICAgYnJl
YWs7Cj4gPiAgICAgICAgIGNhc2UgRVhDX0xPQURfQUNDRVNTOgo+ID4gICAgICAgICAgICAgICAg
IGt2bV9yaXNjdl92Y3B1X3BtdV9pbmNyX2Z3KHZjcHUsIFNCSV9QTVVfRldfQUNDRVNTX0xPQUQp
Owo+ID4gKyAgICAgICAgICAgICAgIHZjcHUtPnN0YXQubG9hZF9hY2Nlc3NfZXhpdHMrKzsKPiA+
ICAgICAgICAgICAgICAgICByZXQgPSB2Y3B1X3JlZGlyZWN0KHZjcHUsIHRyYXApOwo+ID4gICAg
ICAgICAgICAgICAgIGJyZWFrOwo+ID4gICAgICAgICBjYXNlIEVYQ19TVE9SRV9BQ0NFU1M6Cj4g
PiAgICAgICAgICAgICAgICAga3ZtX3Jpc2N2X3ZjcHVfcG11X2luY3JfZncodmNwdSwgU0JJX1BN
VV9GV19BQ0NFU1NfU1RPUkUpOwo+ID4gKyAgICAgICAgICAgICAgIHZjcHUtPnN0YXQuc3RvcmVf
YWNjZXNzX2V4aXRzKys7Cj4gPiAgICAgICAgICAgICAgICAgcmV0ID0gdmNwdV9yZWRpcmVjdCh2
Y3B1LCB0cmFwKTsKPiA+ICAgICAgICAgICAgICAgICBicmVhazsKPiA+ICAgICAgICAgY2FzZSBF
WENfSU5TVF9BQ0NFU1M6Cj4gPgo+ID4gLS0KPiA+IDIuMzQuMQo+ID4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
