Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB90AC433FE
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Nov 2022 17:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CiMADpLIUXGnlH3Pl6H5jeOoJD1f2psPL2F+QS1v7zQ=; b=A7Qzp+9dkJbClr
	UTSWGn7gU81ySgLKiA+OI8SEoWyxSO1hDEz4eqVqDh5RwPSbc2kM8ZSa/H9vQDaNEbLXmeMOyXOOh
	vDtkUWLMwA+CwllnkCeLmXyDuhIXNuXpz32pzX2jDlqy8/KsuT/UANo7uKq2rGYLuUGw14g92hJOj
	XiNJdiceHWHvK+7PlqB9P+WN8Frs2FHCEj7SeFKR4MQ2MV75KdasZedKF5mk1uam7tTMJxVOStTDQ
	HGLOE993fngHK1BzYl0dx25TrhDxHMMUx9bNG3qIeQ3DWAP5pfLbLuOVGHvNetMAxqrS1CGvEFi5F
	t6vfGKletyTb1hq6Azqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxtXA-001APw-I4; Wed, 23 Nov 2022 17:27:40 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxtX7-001AMo-Jk
	for linux-riscv@lists.infradead.org; Wed, 23 Nov 2022 17:27:39 +0000
Received: by mail-pf1-x42f.google.com with SMTP id y13so17940099pfp.7
        for <linux-riscv@lists.infradead.org>; Wed, 23 Nov 2022 09:27:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lpmaIKnrCiI4dvK6OHphu9fCVFQl5+naAN7dmWdbu6Y=;
        b=hTepHPcEdaE8aWTpVsBV28Kfw+AScDUUMp1OWmNWZkDvAs8vu9XSl97xS+VwCan0zc
         pIqlwsAT2klMTrfB2nKQZmP3b2TvvP7boaGYLqWhxorXfY6AaJepQreCO1UPwaxqTZCm
         tcHgAOyyi4BQRQARd187JP6i8eclEEUSO3q7PmzFNo0mC33WjqWMXEUqJQQqxe+DbcVT
         v46sJGgnIWQP8Rf+7NIQTQYpJLRydAf2qJtizRKWA5fdA8345MK+Dz480CJsI84jdWpD
         a8gNH/YmsX6pZZrt8AM5059jH3FazvOjXTZyzhywzNobWaNnHs/lipbRM9TKGm4u3RT9
         NPcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lpmaIKnrCiI4dvK6OHphu9fCVFQl5+naAN7dmWdbu6Y=;
        b=BeyiTqoeDrEQA7e53VY47AJbzO1OKMOFHGrihaHH7g/de4H1tzupx66wfQY3uyGR3r
         PNTD8fSTuFCq9KOb42iFA3sx6ewEORHSfAOdJOaIVi+8ly3W1GGETbCBu8HEQb1Hll4t
         FckH+17uDjzMQSMW9x/yw8AGFAs0I/JDKhXIKvkxASWmWY22OYbtoWz0cxhaDbeHXVw0
         GcLttob2PmYcNccHBxpOnE25ebzQMZyU5CWejPXzkEagBrtP0hnfSYnYoc3tlB62yGq/
         MWtW52Q/qVA7y8XUSh6p0LxvngZdwwgaWEfIy7zfS4kv1oHe2G/Ntbw2Xx4DQErVFj1h
         oHCQ==
X-Gm-Message-State: ANoB5pnCRB0y3oumSid8W5SwD0VNlkTUTw9xyFxlNnYuE7HX51DJ/rZt
	WBEtMHn5/0JEKs61CEoKySTx8YD2MaBKeHmMZkE=
X-Google-Smtp-Source: AA0mqf7CRXwpttGvvthhj0/eYYlegEoG4pgsx4gg/zyYwVlbyxVGhqcY4H/bUoc2X4vDbexQVQLdhZzT6SNjnUwA308=
X-Received: by 2002:a63:e401:0:b0:46f:c183:2437 with SMTP id
 a1-20020a63e401000000b0046fc1832437mr27325610pgi.613.1669224450105; Wed, 23
 Nov 2022 09:27:30 -0800 (PST)
MIME-Version: 1.0
References: <20221123142025.1504030-1-suagrfillet@gmail.com>
 <20221123142025.1504030-2-suagrfillet@gmail.com> <CAJF2gTTwvApRaGhZJxOrdcjWUC9DN-WF_7EKcHXx5HZ9Jkd5EA@mail.gmail.com>
In-Reply-To: <CAJF2gTTwvApRaGhZJxOrdcjWUC9DN-WF_7EKcHXx5HZ9Jkd5EA@mail.gmail.com>
From: Song Shuai <suagrfillet@gmail.com>
Date: Thu, 24 Nov 2022 01:27:19 +0800
Message-ID: <CAAYs2=ghhMmmrM4Bktvw9iGiajS5PLd1=Z61j2ZfhbhGUi4ekg@mail.gmail.com>
Subject: Re: [PATCH 1/2] riscv/ftrace: add DYNAMIC_FTRACE_WITH_DIRECT_CALLS support
To: Guo Ren <guoren@kernel.org>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	rostedt@goodmis.org, mhiramat@kernel.org, mark.rutland@arm.com, 
	peterz@infradead.org, jolsa@redhat.com, bp@suse.de, jpoimboe@kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221123_092737_655610_57F246C1 
X-CRM114-Status: GOOD (  18.68  )
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

R3VvIFJlbiA8Z3VvcmVuQGtlcm5lbC5vcmc+IOS6jjIwMjLlubQxMeaciDIz5pel5ZGo5LiJIDIz
OjAy5YaZ6YGT77yaCj4KPiBDb29sIGpvYiwgdGh4Lgo+Cj4gT24gV2VkLCBOb3YgMjMsIDIwMjIg
YXQgMTA6MjAgUE0gU29uZyBTaHVhaSA8c3VhZ3JmaWxsZXRAZ21haWwuY29tPiB3cm90ZToKPj4K
Pj4gVGhpcyBwYXRjaCBhZGRzIERZTkFNSUNfRlRSQUNFX1dJVEhfRElSRUNUX0NBTExTIHN1cHBv
cnQgZm9yIFJJU0MtVi4KPj4KPj4gc2VsZWN0IHRoZSBEWU5BTUlDX0ZUUkFDRV9XSVRIX0RJUkVD
VF9DQUxMUyB0byBwcm92aWRlIHRoZQo+PiByZWdpc3Rlcl9mdHJhY2VfZGlyZWN0W19tdWx0aV0g
aW50ZXJmYWNlcyBhbGxvd2luZyB1c2VycyB0byByZWdpc3Rlcgo+PiB0aGUgY3VzdG9tZWQgdHJh
bXBvbGluZSAoZGlyZWN0X2NhbGxlcikgYXMgdGhlIG1jb3VudCBmb3Igb25lIG9yCj4+IG1vcmUg
dGFyZ2V0IGZ1bmN0aW9ucy4gQW5kIG1vZGlmeV9mdHJhY2VfZGlyZWN0W19tdWx0aV0gYXJlIGFs
c28KPj4gcHJvdmlkZWQgZm9yIG1vZGlmeWluZyBkaXJlY3RfY2FsbGVyLgo+Pgo+PiBUbyBtYWtl
IHRoZSBkaXJlY3RfY2FsbGVyIGFuZCB0aGUgb3RoZXIgZnRyYWNlIGhvb2tzIChlZy4gZnVuY3Rp
b24vZmdyYXBoCj4+IHRyYWNlciwga1tyZXRdcHJvYmVzKSBjby1leGlzdCwgYSB0ZW1wb3Jhcnkg
cmVnaXN0ZXIgaXMgbm9taW5hdGVkIHRvCj4+IHN0b3JlIHRoZSBhZGRyZXNzIG9mIGRpcmVjdF9j
YWxsZXIgaW4gZnRyYWNlX3JlZ3NfY2FsbGVyLiBBZnRlciB0aGUKPj4gc2V0dGluZyBvZiB0aGUg
YWRkcmVzcyBkaXJlY3RfY2FsbGVyIGJ5IGRpcmVjdF9vcHMtPmZ1bmMgYW5kIHRoZQo+PiBSRVNU
T1JFX1JFR1MgaW4gZnRyYWNlX3JlZ3NfY2FsbGVyLCBkaXJlY3RfY2FsbGVyIHdpbGwgYmUganVt
cGVkIHRvCj4+IGJ5IHRoZSBganJgIGluc3QuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFNvbmcgU2h1
YWkgPHN1YWdyZmlsbGV0QGdtYWlsLmNvbT4KPj4gLS0tCj4+ICBhcmNoL3Jpc2N2L0tjb25maWcg
ICAgICAgICAgICAgIHwgMSArCj4+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2Z0cmFjZS5oIHwg
NiArKysrKysKPj4gIGFyY2gvcmlzY3Yva2VybmVsL21jb3VudC1keW4uUyAgfCA0ICsrKysKPj4g
IDMgZmlsZXMgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvYXJj
aC9yaXNjdi9LY29uZmlnIGIvYXJjaC9yaXNjdi9LY29uZmlnCj4+IGluZGV4IDM5ZWM4ZDYyOGNm
Ni4uZDA4M2VjMDhkMGI2IDEwMDY0NAo+PiAtLS0gYS9hcmNoL3Jpc2N2L0tjb25maWcKPj4gKysr
IGIvYXJjaC9yaXNjdi9LY29uZmlnCj4+IEBAIC0yNzgsNiArMjc4LDcgQEAgY29uZmlnIEFSQ0hf
UlY2NEkKPj4gICAgICAgICBzZWxlY3QgQVJDSF9TVVBQT1JUU19JTlQxMjggaWYgQ0NfSEFTX0lO
VDEyOAo+PiAgICAgICAgIHNlbGVjdCBIQVZFX0RZTkFNSUNfRlRSQUNFIGlmICFYSVBfS0VSTkVM
ICYmIE1NVSAmJiAkKGNjLW9wdGlvbiwtZnBhdGNoYWJsZS1mdW5jdGlvbi1lbnRyeT04KQo+PiAg
ICAgICAgIHNlbGVjdCBIQVZFX0RZTkFNSUNfRlRSQUNFX1dJVEhfUkVHUyBpZiBIQVZFX0RZTkFN
SUNfRlRSQUNFCj4+ICsgICAgICAgc2VsZWN0IEhBVkVfRFlOQU1JQ19GVFJBQ0VfV0lUSF9ESVJF
Q1RfQ0FMTFMKPj4gICAgICAgICBzZWxlY3QgSEFWRV9GVFJBQ0VfTUNPVU5UX1JFQ09SRCBpZiAh
WElQX0tFUk5FTAo+PiAgICAgICAgIHNlbGVjdCBIQVZFX0ZVTkNUSU9OX0dSQVBIX1RSQUNFUgo+
PiAgICAgICAgIHNlbGVjdCBIQVZFX0ZVTkNUSU9OX1RSQUNFUiBpZiAhWElQX0tFUk5FTCAmJiAh
UFJFRU1QVElPTgo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9mdHJhY2Uu
aCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vZnRyYWNlLmgKPj4gaW5kZXggMDFiZWJiMjhlYWJl
Li5iZTRkNTc1NjYxMzkgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vZnRy
YWNlLmgKPj4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9mdHJhY2UuaAo+PiBAQCAtMTE0
LDYgKzExNCwxMiBAQCBzdHJ1Y3QgZnRyYWNlX3JlZ3M7Cj4+ICB2b2lkIGZ0cmFjZV9ncmFwaF9m
dW5jKHVuc2lnbmVkIGxvbmcgaXAsIHVuc2lnbmVkIGxvbmcgcGFyZW50X2lwLAo+PiAgICAgICAg
ICAgICAgICAgICAgICAgIHN0cnVjdCBmdHJhY2Vfb3BzICpvcCwgc3RydWN0IGZ0cmFjZV9yZWdz
ICpmcmVncyk7Cj4+ICAjZGVmaW5lIGZ0cmFjZV9ncmFwaF9mdW5jIGZ0cmFjZV9ncmFwaF9mdW5j
Cj4+ICsKPj4gK3N0YXRpYyBpbmxpbmUgdm9pZCBhcmNoX2Z0cmFjZV9zZXRfZGlyZWN0X2NhbGxl
cihzdHJ1Y3QgcHRfcmVncyAqcmVncywgdW5zaWduZWQgbG9uZyBhZGRyKQo+PiArewo+PiArICAg
ICAgICAgICAgICAgcmVncy0+dDEgPSBhZGRyOwo+Cj4gSG93IGFib3V0IHJlZ3MtPnQwID0gYWRk
cjsgPwo+IEFuZCBkZWxldGUgYWxsIG1jb3VudC1keW4uUyBtb2RpZmljYXRpb24uCj4KVGhlIGRp
cmVjdF9jYWxsZXIgaGFzIHRoZSBzYW1lIHByb2dyYW0gbGF5b3V0IGFzIHRoZSBmdHJhY2VfY2Fs
bGVyLCB3aGljaCBtZWFucwp0aGUgcmVnIHQwIHdpbGwgbmV2ZXIgYmUgY2hhbmdlZCB3aGVuIGRp
cmVjdF9jYWxsZXIgcmV0dXJucy4KCklmIHJlZ3MtPnQwIGNoYW5nZXMgaGVyZSBhbmQgZnRyYWNl
X3JlZ3NfY2FsbGVyIGV4ZWN1dGVzIGBqciB0MGAsCmRpcmVjdF9jYWxsZXIgd2lsbCBlbnRlciB0
aGUgZGVhZCBsb29wLgoKQWN0dWFsbHkgdGhlIHJlZyB0MCBhbHdheXMgc2F2ZXMgdGhlIGFkZHJl
c3Mgb2YgZnVuY3Rpb24gZW50cnkgd2l0aCA4QgpvZmZzZXQsIGl0IHNob3VsZCBvbmx5CmNoYW5n
ZWQgYnkgdGhlIElQTU9ESUZZIG9wcyBpbnN0ZWFkIG9mIHRoZSBkaXJlY3Rfb3BzLgo+Pgo+PiAr
fQo+PiArCj4+ICAjZW5kaWYgLyogQ09ORklHX0RZTkFNSUNfRlRSQUNFX1dJVEhfUkVHUyAqLwo+
Pgo+PiAgI2VuZGlmIC8qIF9fQVNTRU1CTFlfXyAqLwo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNj
di9rZXJuZWwvbWNvdW50LWR5bi5TIGIvYXJjaC9yaXNjdi9rZXJuZWwvbWNvdW50LWR5bi5TCj4+
IGluZGV4IDQ2NmM2ZWYyMTdiMS4uYjg5Yzg1YTU4NTY5IDEwMDY0NAo+PiAtLS0gYS9hcmNoL3Jp
c2N2L2tlcm5lbC9tY291bnQtZHluLlMKPj4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvbWNvdW50
LWR5bi5TCj4+IEBAIC0yMzMsNiArMjMzLDcgQEAgRU5EUFJPQyhmdHJhY2VfY2FsbGVyKQo+PiAg
I2Vsc2UgLyogQ09ORklHX0RZTkFNSUNfRlRSQUNFX1dJVEhfUkVHUyAqLwo+PiAgRU5UUlkoZnRy
YWNlX3JlZ3NfY2FsbGVyKQo+PiAgICAgICAgIFNBVkVfQUJJX1JFR1MgMQo+PiArICAgICAgIFJF
R19TICAgeDAsIFBUX1QxKHNwKQo+PiAgICAgICAgIFBSRVBBUkVfQVJHUwo+Pgo+PiAgZnRyYWNl
X3JlZ3NfY2FsbDoKPj4gQEAgLTI0MSw3ICsyNDIsMTAgQEAgZnRyYWNlX3JlZ3NfY2FsbDoKPj4K
Pj4KPj4gICAgICAgICBSRVNUT1JFX0FCSV9SRUdTIDEKPj4gKyAgICAgICBibmV6ICAgIHQxLC5M
ZGlyZWN0Cj4+ICAgICAgICAganIgdDAKPj4gKy5MZGlyZWN0Ogo+PiArICAgICAgIGpyIHQxCj4+
ICBFTkRQUk9DKGZ0cmFjZV9yZWdzX2NhbGxlcikKPj4KPj4gIEVOVFJZKGZ0cmFjZV9jYWxsZXIp
Cj4+IC0tCj4+IDIuMjAuMQo+Pgo+Cj4KPiAtLQo+IEJlc3QgUmVnYXJkcwo+ICBHdW8gUmVuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
