Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60352C4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Nov 2023 16:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=SaoP2HvLB6zMXOqEiayDhBAFC8xleDGI3/ql6eLgtws=; b=BdQsxs7nXP3mHhs1VtmCN7hQZc
	gKjhgCp4RRVlTdmuL2/6AopKISo0q6Nsm0N2jveZ8UFcNPxUqn17dDVtrgBuRhNg+qPIdhA7J+R7t
	vJimF5z/TC5aJ6m5nOKsAJqjyAYO5pZ/I7rJhLoyiMylT8c8VLwRgmH35iUdZvg6t92hG2k6uliTJ
	JryuN4Lh1hkK4OSoobpi+PO2gRfRMdLvozH4QCjUlTuzEKF/YdHqX7+rrOxMliYDWw3rPOEMMLwp/
	tY7b/ZSVqUmi00A8DYYkdjDTzFBXAuYc7/xg/LZ3ywrrlpcPWweVqGtG+a1BZCXECjPZIFQTjboVR
	YfStzXbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r17g2-006h5X-0G;
	Thu, 09 Nov 2023 16:14:42 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r17fx-006h4Z-2h
	for linux-riscv@lists.infradead.org;
	Thu, 09 Nov 2023 16:14:39 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-6ba54c3ed97so1101232b3a.2
        for <linux-riscv@lists.infradead.org>; Thu, 09 Nov 2023 08:14:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1699546477; x=1700151277; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FpX1aRY4vi6s1ovpKy5aAzsogTxkJiL9H8TF/8fc0Rs=;
        b=JTFH76WqZdSi9v2gAvqjFcYY1vVDwl4l1kNbmyWpw1OHxdG2B+apNwt0cdEPfMPXyh
         Ig3x9Yjt6Id00lMWfSLCNZl2cctyGo8IDJjpNgJgMWxO0ueDMcLLSLTxOaGUPDEGmY32
         hNKBF4EUlhrYR/lgmZ6G8AGkeL4DIgZUEBAorSRBiMZe3eBV5VsR3aSc64sHFNu0oEN5
         rTPlNmLhQDJNzUBfYwFM4u3hsphu3sS8dJVrFiPOs4ysqBIo4nKnfi/TNwGeKVSHc/K0
         CxSsbPafTWQAym96ZV43WsAU7yNFa6OBp76VvDx+zo3dIlTpBUP24DwafSn0JxWtyXuE
         VBCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699546477; x=1700151277;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FpX1aRY4vi6s1ovpKy5aAzsogTxkJiL9H8TF/8fc0Rs=;
        b=Z6MbJZygDpPCu/rHrcTygg154M+Q5VE8BVD3hsYLuF178zrdgqukjMzSDGTjnd52ft
         Zb9G9DRBgvK9psRCkUqUHgDdYZdDbRa611UIBQxEQIUZeu23k1lBKUohHAP/mOaE0PQY
         p6Kgyeu3lSpshNfl5Al3jBJjo5BO1nfgR9r364LQfMGyhmR3bSK3bIWnDZfsApgw73Hj
         iE+SJBT25FZwFM8Y2squactO8pENxLqBie3/0UfC5M5IlU8a8n9z15Pdhcc6fx/ENyQR
         E3j+2I6yofRGK/Ho4osetzOHILid0AsWJRQTRuE+jMXNpLAk5s1DmFNaA3xTro/p3IuM
         EERw==
X-Gm-Message-State: AOJu0YxgSZmhLBPwuCLVSqPya+5+enXvVPy2/Rdd2iFfQFjMlcn0ykMe
	TNUALzhWRby2DOxrNqC069l6FA==
X-Google-Smtp-Source: AGHT+IE/xIO7qQexPmOKuC2AIQgSt9BeoUEWxOwwA0LYfrVy3WHpFcBMtceSUjydZKSVKBFenn10SQ==
X-Received: by 2002:a05:6300:808d:b0:181:9b30:89d6 with SMTP id ap13-20020a056300808d00b001819b3089d6mr5697084pzc.27.1699546476860;
        Thu, 09 Nov 2023 08:14:36 -0800 (PST)
Received: from localhost ([12.44.203.122])
        by smtp.gmail.com with ESMTPSA id i6-20020aa787c6000000b006c0328b2440sm10905229pfo.150.2023.11.09.08.14.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Nov 2023 08:14:36 -0800 (PST)
Date: Thu, 09 Nov 2023 08:14:36 -0800 (PST)
X-Google-Original-Date: Thu, 09 Nov 2023 08:14:34 PST (-0800)
Subject: Re: [PATCH] selftests: sud_test: return correct emulated syscall value on RISC-V
In-Reply-To: <ef980c24-6901-4bb3-8a1b-5902675e7851@rivosinc.com>
CC: shuah@kernel.org, krisman@collabora.com, linux-kselftest@vger.kernel.org,
  linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: cleger@rivosinc.com, tglx@linutronix.de
Message-ID: <mhng-9af5865a-9208-4308-9eb6-4ec07a4b4cb2@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_081437_874916_65361DB3 
X-CRM114-Status: GOOD (  27.59  )
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

T24gVGh1LCAwOSBOb3YgMjAyMyAwMDoyMjo0NiBQU1QgKC0wODAwKSwgY2xlZ2VyQHJpdm9zaW5j
LmNvbSB3cm90ZToKPgo+Cj4gT24gMDkvMTEvMjAyMyAwNDoyNiwgUGFsbWVyIERhYmJlbHQgd3Jv
dGU6Cj4+IE9uIFdlZCwgMTMgU2VwIDIwMjMgMDc6MDc6MTEgUERUICgtMDcwMCksIGNsZWdlckBy
aXZvc2luYy5jb20gd3JvdGU6Cj4+PiBDdXJyZW50bHksIHRoZSBzdWRfdGVzdCBleHBlY3RzIHRo
ZSBlbXVsYXRlZCBzeXNjYWxsIHRvIHJldHVybiB0aGUKPj4+IGVtdWxhdGVkIHN5c2NhbGwgbnVt
YmVyLiBUaGlzIGFzc3VtcHRpb24gb25seSB3b3JrcyBvbiBhcmNoaXRlY3R1cmVzCj4+PiB3ZXJl
IHRoZSBzeXNjYWxsIGNhbGxpbmcgY29udmVudGlvbiB1c2UgdGhlIHNhbWUgcmVnaXN0ZXIgZm9y
IHN5c2NhbGwKPj4+IG51bWJlci9zeXNjYWxsIHJldHVybiB2YWx1ZS4gVGhpcyBpcyBub3QgdGhl
IGNhc2UgZm9yIFJJU0MtViBhbmQgdGh1cwo+Pj4gdGhlIHJldHVybiB2YWx1ZSBtdXN0IGJlIGFs
c28gZW11bGF0ZWQgdXNpbmcgdGhlIHByb3ZpZGVkIHVjb250ZXh0Lgo+Pj4KPj4+IFNpZ25lZC1v
ZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KPj4+IC0tLQo+Pj4g
wqB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9zeXNjYWxsX3VzZXJfZGlzcGF0Y2gvc3VkX3Rlc3Qu
YyB8IDggKysrKysrKysKPj4+IMKgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKQo+Pj4K
Pj4+IGRpZmYgLS1naXQgYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9zeXNjYWxsX3VzZXJfZGlz
cGF0Y2gvc3VkX3Rlc3QuYwo+Pj4gYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9zeXNjYWxsX3Vz
ZXJfZGlzcGF0Y2gvc3VkX3Rlc3QuYwo+Pj4gaW5kZXggYjVkNTkyZDQwOTllLi4xYjU1NTNjMTk3
MDAgMTAwNjQ0Cj4+PiAtLS0gYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9zeXNjYWxsX3VzZXJf
ZGlzcGF0Y2gvc3VkX3Rlc3QuYwo+Pj4gKysrIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvc3lz
Y2FsbF91c2VyX2Rpc3BhdGNoL3N1ZF90ZXN0LmMKPj4+IEBAIC0xNTgsNiArMTU4LDE0IEBAIHN0
YXRpYyB2b2lkIGhhbmRsZV9zaWdzeXMoaW50IHNpZywgc2lnaW5mb190Cj4+PiAqaW5mbywgdm9p
ZCAqdWNvbnRleHQpCj4+Pgo+Pj4gwqDCoMKgwqAgLyogSW4gcHJlcGFyYXRpb24gZm9yIHNpZ3Jl
dHVybi4gKi8KPj4+IMKgwqDCoMKgIFNZU0NBTExfRElTUEFUQ0hfT0ZGKGdsb2Jfc2VsKTsKPj4+
ICsKPj4+ICvCoMKgwqAgLyoKPj4+ICvCoMKgwqDCoCAqIE1vZGlmeSBpbnRlcnJ1cHRlZCBjb250
ZXh0IHJldHVybmVkIHZhbHVlIGFjY29yZGluZyB0byBzeXNjYWxsCj4+PiArwqDCoMKgwqAgKiBj
YWxsaW5nIGNvbnZlbnRpb24KPj4+ICvCoMKgwqDCoCAqLwo+Pj4gKyNpZiBkZWZpbmVkKF9fcmlz
Y3YpCj4+PiArwqDCoMKgICgodWNvbnRleHRfdCopdWNvbnRleHQpLT51Y19tY29udGV4dC5fX2dy
ZWdzW1JFR19BMF0gPQo+Pj4gTUFHSUNfU1lTQ0FMTF8xOwo+Pj4gKyNlbmRpZgo+Pj4gwqB9Cj4+
Pgo+Pj4gwqBURVNUKGRpc3BhdGNoX2FuZF9yZXR1cm4pCj4+Cj4+IEknbSBub3Qgc3VyZSBpZiBJ
J20ganVzdCB0aXJlZCwgYnV0IGl0IHRvb2sgbWUgYSB3aGlsZSB0byBmaWd1cmUgb3V0IHdoeQo+
PiB0aGlzIHdhcyBuZWNlc3NhcnkuwqAgSSB0aGluayB0aGlzIGlzIGEgYmV0dGVyIGV4cGxhbmF0
aW9uOgo+Cj4gSSB0aGluayBpdCdzIGJlY2F1c2UgdGhpcyBtZWNoYW5pc20gZG9lcyBub3QgYmVo
YXZlIGxpa2Ugb3RoZXIgc3lzY2FsbHMKPiBhdCBhbGwgYW5kIHRoZSBjbGFzc2ljIGNhbGxpbmcg
Y29udmVudGlvbiBkb2VzIG5vdCByZWFsbHkgYXBwbHkuLi4KClllcC4gIEkgYWxzbyBnb3QgdHJp
cHBlZCB1cCBiZWNhdXNlIEkgbWlzLXJlYWQgdGhlIGRvY3MgYW5kIHRob3VnaCAKU0lHU1lTIHdh
cyBvbmx5IGZvciBzb21lIGVycm9yIGNhc2UgKHdoZXJlIGl0J3MgYWN0dWFsbHkgZm9yIGFsbCB0
aGUgCmludGVyY2VwdGVkIHN5c2NhbGxzKS4KCj4+IMKgwqAgZGlmZiAtLWdpdCBhL3Rvb2xzL3Rl
c3Rpbmcvc2VsZnRlc3RzL3N5c2NhbGxfdXNlcl9kaXNwYXRjaC9zdWRfdGVzdC5jCj4+IGIvdG9v
bHMvdGVzdGluZy9zZWxmdGVzdHMvc3lzY2FsbF91c2VyX2Rpc3BhdGNoL3N1ZF90ZXN0LmMKPj4g
wqDCoCBpbmRleCBiNWQ1OTJkNDA5OWUuLmE5MTNmZDkwY2ZhMyAxMDA2NDQKPj4gwqDCoCAtLS0g
YS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9zeXNjYWxsX3VzZXJfZGlzcGF0Y2gvc3VkX3Rlc3Qu
Ywo+PiDCoMKgICsrKyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3N5c2NhbGxfdXNlcl9kaXNw
YXRjaC9zdWRfdGVzdC5jCj4+IMKgwqAgQEAgLTE1OCw2ICsxNTgsMTYgQEAgc3RhdGljIHZvaWQg
aGFuZGxlX3NpZ3N5cyhpbnQgc2lnLCBzaWdpbmZvX3QKPj4gKmluZm8sIHZvaWQgKnVjb250ZXh0
KQo+PiDCoMKgIMKgwqDCoMKgwqDCoMKgIC8qIEluIHByZXBhcmF0aW9uIGZvciBzaWdyZXR1cm4u
ICovCj4+IMKgwqDCoMKgwqDCoMKgIFNZU0NBTExfRElTUEFUQ0hfT0ZGKGdsb2Jfc2VsKTsKPj4g
wqDCoCArwqDCoMKgIC8qCj4+IMKgwqAgK8KgwqDCoMKgICogVGhlIHRlc3RzIGZvciBhcmd1bWVu
dCBoYW5kbGluZyBhc3N1bWUgdGhhdCBgc3lzY2FsbCh4KSA9PQo+PiB4YC7CoCBUaGlzCj4+IMKg
wqAgK8KgwqDCoMKgICogaXMgYSBOT1Agb24geDg2IGJlY2F1c2UgdGhlIHN5c2NhbGwgbnVtYmVy
IGlzIHBhc3NlZCBpbiAlcmF4LAo+PiB3aGljaAo+PiDCoMKgICvCoMKgwqDCoCAqIGhhcHBlbnMg
dG8gYWxzbyBiZSB0aGUgZnVuY3Rpb24gQUJJIHJldHVybiByZWdpc3Rlci7CoCBPdGhlcgo+PiDC
oMKgICvCoMKgwqDCoCAqIGFyY2hpdGVjdHVyZXMgbWF5IG5lZWQgdG8gc3dpenpsZSB0aGUgYXJn
dW1lbnRzIGFyb3VuZC4KPj4gwqDCoCArwqDCoMKgwqAgKi8KPgo+IEluZGVlZCwgdGhhdCBpcyBt
b3JlIGNsZWFyLiBTaG91bGQgSSBzZW5kIGEgdjIgPwoKSSB3b3VsZCwgYnV0ICtUaG9tYXMgYXMg
aXQgbG9va3MgbGlrZSBoZSdzIHRoZSBvbmUgdGFraW5nIHBhdGNoZXMgZm9yIAp0aGlzLgoKPgo+
PiDCoMKgICsjaWYgZGVmaW5lZChfX3Jpc2N2KQo+PiDCoMKgICvCoMKgwqAgKHVjb250ZXh0X3Qq
KXVjb250ZXh0KS0+dWNfbWNvbnRleHQuX19ncmVnc1tSRUdfQTBdID0KPj4gwqDCoCArwqDCoMKg
wqDCoMKgwqAgKHVjb250ZXh0X3QqKXVjb250ZXh0KS0+dWNfbWNvbnRleHQuX19ncmVnc1tSRUdf
QTddOwo+PiDCoMKgICsjZW5kaWYKPj4gwqDCoMKgIH0KPj4gwqDCoCDCoMKgwqAgVEVTVChkaXNw
YXRjaF9hbmRfcmV0dXJuKQo+Pgo+PiBidXQgYWxzbwo+Pgo+PiBSZXZpZXdlZC1ieTogUGFsbWVy
IERhYmJlbHQgPHBhbG1lckByaXZvc2luYy5jb20+Cj4+IEFja2VkLWJ5OiBQYWxtZXIgRGFiYmVs
dCA8cGFsbWVyQHJpdm9zaW5jLmNvbT4KPj4KPj4gYXMgSSBhZ3JlZSB0aGlzIGlzIGNvcnJlY3Qu
Cj4+Cj4+IGFsc286IHdvdWxkbid0IGFybTY0IGFsc28gbmVlZCB0byBtb3ZlIHg4IGludG8geDAg
aGVyZSwgZm9yIGVzc2VudGlhbGx5Cj4+IHRoZSBzYW1lIHJlYXNvbiBhcyB3ZSBkbz8KPgo+IFll
cywgYXMgd2VsbCBhcyBmb3IgYSBidW5jaCBvZiBvdGhlciBhcmNoaXRlY3R1cmVzLiBJIHN1c3Bl
Y3QgdGhpcyBoYXMKPiBvbmx5IGJlZW4gdGVzdGVkIG9uIHg4Ni4gQUZBSUssIHRoaXMgZmVhdHVy
ZSBpcyBtYWlubHkgZm9yIHdpbmUgdXNhZ2UKPiB3aGljaCB0aGVuIG1ha2VzIHNlbnNlIGZvciB4
ODYgYW5kIGdhbWVzLgoKWWEsIG1ha2VzIHNlbnNlIC0tIEknZCBqdXN0IGxvb2tlZCBhdCBBcm0g
dG8gZG91YmxlLWNoZWNrIG15IAp1bmRlcnN0YW5kaW5nIGhlcmUsIGFzIHdlIHVzdWFsbHkgZG9u
J3QgZmluZCBidWdzIGluIGdlbmVyaWMgY29kZSBiZWZvcmUgCkFybSBkb2VzLgoKPgo+IFRoYW5r
cywKPgo+IENsw6ltZW50CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
