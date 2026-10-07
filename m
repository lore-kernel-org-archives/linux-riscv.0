Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B460BCA5FFF
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Oct 2026 08:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nVKD+zcN4N5EANolEfJzRBnySYr7wt6prPHg3oX4gVA=; b=SGmvr55ZPFdEWd
	7SHuOQSU0oTSa0he6P2Y/b7DVy0HDxNcCyy7se5XdnXnM4OSnVqM0AxSb0g4nQtRO2nUj+GXKOwBX
	5M9j3PI3JChpQDPGtwHeO9a9P8fbGy2wNV2xx803zq1UyQDAitc9dQc5OzYxaww9hDFkPQwbXEZho
	o5wL8MAOukXvViISmernGnuGwiDxAMdOVeH7hTkHT+7FIlBoohqIWlZMQS1Y8nR7vcyStFJ1Ni01W
	xclVHt1R/nc+xISkLb9v9h41Bv02FZ3N1wsunkXmTAg8x6Nz4T1d2rbX0vi8Ch6r70Yl2OxrHrc3l
	XerI6emRMHQBRiktgv6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEMeV-00000001uus-1cqW;
	Wed, 07 Oct 2026 08:05:27 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEMeS-00000001uuS-0njI
	for linux-riscv@lists.infradead.org;
	Wed, 07 Oct 2026 08:05:25 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4a0e1b0681bso10630465e9.3
        for <linux-riscv@lists.infradead.org>; Wed, 07 Oct 2026 01:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791360322; x=1791965122; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=v5nDkXCXtLopN/dGr01gYXBLYEX8HBQVPURAZPTClNE=;
        b=kPtdwjA4GzWgoWPGv31jtmfAe+dO45YrZaF6YgzwxECGFp/qOxqoTLummoC0ipCeEm
         wUPi99ofNT3mQRVln5iNfK3Q87Y25CuJpjY9xua9uZhiXs7dWrufzTAILFc/YAe0ntOz
         0OPVVkibYmCCYLog38m8/qTvLz99/rI7iim5/AcJfylbD7oFLzXVwt03AkoY8tbq8erI
         CXKuATpm3IxzS+NBGVcUchDp6+Y/xs7A1GI8i1Kao5K/xHS20kdF0f32OECA+pzfxj+2
         8rdrAns0WlNdARJKMvKn0jrDNQlUk62v+Yke6bK44bETuOyHzfEhN9RyJMGbD8DicWSA
         8g5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791360322; x=1791965122;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=v5nDkXCXtLopN/dGr01gYXBLYEX8HBQVPURAZPTClNE=;
        b=J64jFa47Bx0CE3Y2li0G6e9/jXi0Se6MQHDqV58NHDX6nXu1JTa2kXrUuiNuhB5rn+
         CQTDq7/LeGstiy7WVSCMS0ThaaSRlJ2o/tOiohX1nRev2nPFwkCvY4cMjkSyZ2lw/eOl
         bb87A60sg9q+qToPNeEjBIXRboXOhU4UVBVU886zjHkO0ZYBfTQjr7K8myoPjrcYPN4U
         jSHy3XooHA3J546rpNhkxABws17szNRhZ1geUKrs9WQHNsDzU03NVKz8s69w+1WGQ17J
         c5tehJcVaa5TdSZbn20x4I1I/70b3Yjf59iCdV03eSlh4emyqsdO0LWROO7TySjnvUl3
         cDXg==
X-Gm-Message-State: AFuF++lxO3uqrtaa4/Lndky7AtZQBE3vdupr2rbvq5aXZExJ+HSkwA0b
	z+uRoRA+3WjvwBOu20UQvqbYlIjhCShU5LHUPn/I5kJJ0zvFc4NDc0g1
X-Gm-Gg: AYBFou23GuhwsgpDayibcu5cmqHWwCDrXO6vmU4fLVnUPflvLZtn1LcX52gwhsc8EM0
	e39HCY1FeKe3WflwUPsnjkVm7PY2NY1vFMmgsxS4pQRI0DOY1gKeAWMCeuMlrxsEhusnzB1GyDw
	Yg+dgEnziDXLDsvNR25OBdY2bJAf6R1BuQOZKpkQrffCuGUpTfvh5VSB/tler52yyWDBp6AVaDK
	cxA9fBCm1pVIVma6CFC5W24rBd1SenW4Nv/MXQ3ZWNuR66X0BC0bhbUbxoRWtmu5EwNFQ/k646T
	XmLKo9MDLBEFEcqUd7GzfTCCsKCoxYGqgfWVTyEeasQPytWQPJ9/9+Q0VoGDzD2oyp3H3wEB5lE
	o7KtQkt4fkOuSxrh2Dzs0ety0v3vFUJQ2TYwGsnMVcYKBtyieJlaDkF5L6DzVQJtSNb4g2rB9k3
	jJsxv0eI0nqHbjKxIPHjX1Qq5S4p4bEHPaAhjhtzoSoVQ1ov2SVLrJmrOMD2/A2jt8dUMLzL3h3
	y5sCmKWQ/r9kqgx6HdwtuN1MIgo+M8vWm/Fq4Usq3cmNDnyiGlJ6iy9DyHN8sc=
X-Received: by 2002:a05:600c:34c5:b0:4a1:6ad5:257d with SMTP id 5b1f17b1804b1-4a18065ec2fmr19406915e9.29.1791360321830;
        Wed, 07 Oct 2026 01:05:21 -0700 (PDT)
Received: from blinky (90-182-211-1.rcp.o2.cz. [90.182.211.1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178c50f54sm123829665e9.10.2026.10.07.01.05.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 01:05:21 -0700 (PDT)
Date: Wed, 7 Oct 2026 01:05:19 -0700
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
To: Radim =?utf-8?B?S3LEjW3DocWZ?= <radim.krcmar@oss.qualcomm.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Samuel Holland <samuel.holland@sifive.com>,
	Andy Chiu <andybnac@gmail.com>, Guodong Xu <guodong@riscstar.com>,
	Zong Li <zong.li@sifive.com>
Subject: Re: [PATCH 1/6] riscv: hwprobe: Report FP extensions only when
 available
Message-ID: <asX9P5ZEcSUdiuiz@blinky>
References: <20261006075303.205216-1-radim.krcmar@oss.qualcomm.com>
 <20261006075303.205216-2-radim.krcmar@oss.qualcomm.com>
 <179133089395.137225.157195939155119911.b4-review@b4>
 <DLYFU3VAEP3D.OTOZB5Y3BADZ@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DLYFU3VAEP3D.OTOZB5Y3BADZ@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_010524_283691_2356F653 
X-CRM114-Status: GOOD (  25.06  )
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

T24gV2VkLCBPY3QgMDcsIDIwMjYgYXQgMDk6NDY6MzFBTSArMDIwMCwgUmFkaW0gS3LEjW3DocWZ
IHdyb3RlOgo+IDIwMjYtMTAtMDZUMTY6NTQ6NTMtMDc6MDAsIENoYXJsaWUgSmVua2lucyA8dGhl
Y2hhcmxlc2plbmtpbnNAZ21haWwuY29tPjoKPiA+PiBVc2VyLW1vZGUgdXNlIG9mIFpjZCwgWmNm
LCBaZmEsIFpmYmZtaW4sIFpmaCBhbmQgWmZobWluIHJlcXVpcmVzCj4gPj4gbm9uLU9mZiBzc3Rh
dHVzLkZTLCB3aGljaCB3ZSBzZXQgb25seSB3aGVuIGhhc19mcHUoKSAoQ09ORklHX0ZQVSBhbmQg
RAo+ID4+IG9uIGFsbCBoYXJ0cykuICBUaGUgdmVjdG9yIGZsb2F0aW5nLXBvaW50IGV4dGVuc2lv
bnMgWnZlMzJmLCBadmU2NGYsCj4gPj4gWnZlNjRkLCBadmZiZm1pbiwgWnZmYmZ3bWEsIFp2Zmgg
YW5kIFp2ZmhtaW4gcmVxdWlyZSBpdCBhcyB3ZWxsLCBidXQKPiA+PiBod3Byb2JlIGdhdGVzIHRo
ZW0gb25seSBvbiBoYXNfdmVjdG9yKCkuICBod3Byb2JlIG90aGVyd2lzZSByZXBvcnRzIHRoZQo+
ID4+IGV4dGVuc2lvbnMgZnJvbSB0aGUgcGVyLWhhcnQgSVNBIGJpdG1hcHMgYWxvbmUsIHNvIGl0
IGNhbiBhZHZlcnRpc2UKPiA+PiBleHRlbnNpb25zIHRoYXQgYXJlIGFsd2F5cyBkaXNhYmxlZCBp
biB1c2VyLW1vZGUuCj4gPj4gCj4gPj4gUmVwb3J0IGNvcnJlY3QgZW52aXJvbm1lbnQgdG8gdXNl
ci1tb2RlLgo+ID4+IAo+ID4+IEZpeGVzOiAyZTJjZjU1ODFmY2MgKCJyaXNjdjogY3B1ZmVhdHVy
ZTogYWRkIHZhbGlkYXRpb24gZm9yIHpmYSwgemZoIGFuZCB6ZmhtaW4iKQo+ID4+IEZpeGVzOiBk
ZThmODI4MmE5NjkgKCJyaXNjdjogaHdwcm9iZTogYWRkIHp2ZSBWZWN0b3Igc3ViZXh0ZW5zaW9u
cyBpbnRvIGh3cHJvYmUgaW50ZXJmYWNlIikKPiA+PiBGaXhlczogNWRhZGRhNWU2YTU5ICgicmlz
Y3Y6IGh3cHJvYmU6IGV4cG9ydCBadmZoW21pbl0gSVNBIGV4dGVuc2lvbnMiKQo+ID4+IFNpZ25l
ZC1vZmYtYnk6IFJhZGltIEtyxI1tw6HFmSA8cmFkaW0ua3JjbWFyQG9zcy5xdWFsY29tbS5jb20+
Cj4gPj4KPiA+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvc3lzX2h3cHJvYmUuYyBi
L2FyY2gvcmlzY3Yva2VybmVsL3N5c19od3Byb2JlLmMKPiA+PiBpbmRleCA3ODE4ZTFkMzI2MjIu
LmI1N2NjZDExNmJiMSAxMDA2NDQKPiA+PiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNfaHdw
cm9iZS5jCj4gPj4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvc3lzX2h3cHJvYmUuYwo+ID4+IEBA
IC0xNDYsMTUgKzE0Niw4IEBAIHN0YXRpYyB2b2lkIGh3cHJvYmVfaXNhX2V4dDAoc3RydWN0IHJp
c2N2X2h3cHJvYmUgKnBhaXIsCj4gPj4gIAkJaWYgKGhhc192ZWN0b3IoKSkgewo+ID4+ICAJCQlF
WFRfS0VZKGlzYWluZm8tPmlzYSwgWlZCQiwgcGFpci0+dmFsdWUsIG1pc3NpbmcpOwo+ID4+ICAJ
CQlFWFRfS0VZKGlzYWluZm8tPmlzYSwgWlZCQywgcGFpci0+dmFsdWUsIG1pc3NpbmcpOwo+ID4+
IC0JCQlFWFRfS0VZKGlzYWluZm8tPmlzYSwgWlZFMzJGLCBwYWlyLT52YWx1ZSwgbWlzc2luZyk7
Cj4gPj4gIAkJCUVYVF9LRVkoaXNhaW5mby0+aXNhLCBaVkUzMlgsIHBhaXItPnZhbHVlLCBtaXNz
aW5nKTsKPiA+PiAtCQkJRVhUX0tFWShpc2FpbmZvLT5pc2EsIFpWRTY0RCwgcGFpci0+dmFsdWUs
IG1pc3NpbmcpOwo+ID4+IC0JCQlFWFRfS0VZKGlzYWluZm8tPmlzYSwgWlZFNjRGLCBwYWlyLT52
YWx1ZSwgbWlzc2luZyk7Cj4gPj4gIAkJCUVYVF9LRVkoaXNhaW5mby0+aXNhLCBaVkU2NFgsIHBh
aXItPnZhbHVlLCBtaXNzaW5nKTsKPiA+PiAtCQkJRVhUX0tFWShpc2FpbmZvLT5pc2EsIFpWRkJG
TUlOLCBwYWlyLT52YWx1ZSwgbWlzc2luZyk7Cj4gPj4gLQkJCUVYVF9LRVkoaXNhaW5mby0+aXNh
LCBaVkZCRldNQSwgcGFpci0+dmFsdWUsIG1pc3NpbmcpOwo+ID4+IC0JCQlFWFRfS0VZKGlzYWlu
Zm8tPmlzYSwgWlZGSCwgcGFpci0+dmFsdWUsIG1pc3NpbmcpOwo+ID4+IC0JCQlFWFRfS0VZKGlz
YWluZm8tPmlzYSwgWlZGSE1JTiwgcGFpci0+dmFsdWUsIG1pc3NpbmcpOwo+ID4+ICAJCQlFWFRf
S0VZKGlzYWluZm8tPmlzYSwgWlZLQiwgcGFpci0+dmFsdWUsIG1pc3NpbmcpOwo+ID4+ICAJCQlF
WFRfS0VZKGlzYWluZm8tPmlzYSwgWlZLRywgcGFpci0+dmFsdWUsIG1pc3NpbmcpOwo+ID4+ICAJ
CQlFWFRfS0VZKGlzYWluZm8tPmlzYSwgWlZLTkVELCBwYWlyLT52YWx1ZSwgbWlzc2luZyk7Cj4g
Pj4gQEAgLTE2MywxNCArMTU2LDI2IEBAIHN0YXRpYyB2b2lkIGh3cHJvYmVfaXNhX2V4dDAoc3Ry
dWN0IHJpc2N2X2h3cHJvYmUgKnBhaXIsCj4gPj4gIAkJCUVYVF9LRVkoaXNhaW5mby0+aXNhLCBa
VktTRUQsIHBhaXItPnZhbHVlLCBtaXNzaW5nKTsKPiA+PiAgCQkJRVhUX0tFWShpc2FpbmZvLT5p
c2EsIFpWS1NILCBwYWlyLT52YWx1ZSwgbWlzc2luZyk7Cj4gPj4gIAkJCUVYVF9LRVkoaXNhaW5m
by0+aXNhLCBaVktULCBwYWlyLT52YWx1ZSwgbWlzc2luZyk7Cj4gPj4gKwo+ID4+ICsJCQlpZiAo
aGFzX2ZwdSgpKSB7Cj4gPj4gKwkJCQlFWFRfS0VZKGlzYWluZm8tPmlzYSwgWlZFMzJGLCBwYWly
LT52YWx1ZSwgbWlzc2luZyk7Cj4gPj4gKwkJCQlFWFRfS0VZKGlzYWluZm8tPmlzYSwgWlZFNjRE
LCBwYWlyLT52YWx1ZSwgbWlzc2luZyk7Cj4gPj4gKwkJCQlFWFRfS0VZKGlzYWluZm8tPmlzYSwg
WlZFNjRGLCBwYWlyLT52YWx1ZSwgbWlzc2luZyk7Cj4gPj4gKwkJCQlFWFRfS0VZKGlzYWluZm8t
PmlzYSwgWlZGQkZNSU4sIHBhaXItPnZhbHVlLCBtaXNzaW5nKTsKPiA+PiArCQkJCUVYVF9LRVko
aXNhaW5mby0+aXNhLCBaVkZCRldNQSwgcGFpci0+dmFsdWUsIG1pc3NpbmcpOwo+ID4+ICsJCQkJ
RVhUX0tFWShpc2FpbmZvLT5pc2EsIFpWRkgsIHBhaXItPnZhbHVlLCBtaXNzaW5nKTsKPiA+PiAr
CQkJCUVYVF9LRVkoaXNhaW5mby0+aXNhLCBaVkZITUlOLCBwYWlyLT52YWx1ZSwgbWlzc2luZyk7
Cj4gPgo+ID4gVGhlIHZlY3RvciBLY29uZmlnIGlzIGdhdGVkIG9uIEZQVT15IHNvIHRoZSB2ZWN0
b3IgaW5zdHJ1Y3Rpb25zIGNhbid0Cj4gPiBldmVyIGJlIGVuYWJsZWQgd2hlbiBGUFU9bi4KPiAK
PiBSaWdodCwgSSdsbCBtYWtlIHRoZSBjb21taXQgbWVzc2FnZSBjbGVhcmVyIGluIHYyLgo+ICha
dmUzMnggYW5kIGhlbmNlIGhhc192ZWN0b3IoKSBjYW4gdGVjaG5pY2FsbHkgZXhpc3Qgd2l0aG91
dCBDT05GSUdfRlBVLAo+ICBzbyBmdXR1cmUgaW1wbGVtZW50YXRpb25zIG1pZ2h0IHJlcXVpcmUg
dXNlIHRvIHJlbW92ZSB0aGUgZGVwZW5kZW5jeS4pCgpZZWFoIGhhdmluZyB2ZWN0b3IgZGVwZW5k
ZW50IG9uIEZQVSBpcyBub3QgcmVhbGx5IGFjY3VyYXRlIGJ1dCBzaW5jZQpub2JvZHkgaGFzIGJ1
aWx0IHZlY3RvciBoYXJkd2FyZSB3aXRob3V0IGFuIEZQVSBpdCBoYXNuJ3QgY29tZSB1cCB5ZXQu
IEkKZmVlbCB0aGF0IHdvdWxkIGJlIGhpZ2hseSB1bmxpa2VseSB0byBoYXBwZW4gYW5kIHByb2Jh
Ymx5IG5vdCBhIGdvb2QKaWRlYSBzbyBtYXliZSBpdCB3b24ndCBldmVyIGhhcHBlbi4uLgoKPiAK
PiBJIHRoaW5rIHRoaXMgY2hlY2sgaXMgYWRkaW5nIGEgYml0IG9mIHNhbml0eSwgYWx0aG91Z2gg
dGhlIHBsYXRmb3Jtcwo+IHdoZXJlIGl0IGNvbWVzIGludG8gcGxheSBhcmUgYWxyZWFkeSB2ZXJ5
IHdpbGQuCgpZZWFoIEkgYWdyZWUsIGl0IGlzIHJlYXNvbmFibGUgdG8gYWRkIHRoZSBjaGVjayBo
ZXJlLgoKLSBDaGFybGllCgo+IAo+IGhhc19mcHUoKT1mYWxzZSBhbmQgaGFzX3ZlY3RvcigpPXRy
dWUgaXMgcG9zc2libGUgb24gaGV0ZXJvZ2Vub3VzCj4gcGxhdGZvcm1zIHNpbmNlIHRoZSBmaWx0
ZXJpbmcvdmFsaWRhdGlvbiBvZiBmbG9hdGluZyB2ZWN0b3IgZXh0ZW5zaW9ucwo+IGhhcHBlbnMg
b24gRiBleHRlbnNpb24gc3VwcG9ydCBvbiB0aGF0IGhhcnQgYWxvbmUuCj4gCj4gSWYgb3RoZXIg
aGFydCBkb2Vzbid0IHN1cHBvcnQgRiwgYWxsIGhhcnRzIHdpbGwgdHJhcCBmbG9hdGluZyB2ZWN0
b3IKPiBleHRlbnNpb24gYXMgbXN0YXR1cy5GUz1PZmYsIGFsdGhvdWdoIHNjYWxhciB2ZWN0b3Ig
c2hvdWxkIHN0aWxsIHdvcmsKPiBiZWNhdXNlIGhhc192ZWN0b3IoKSBpc24ndCBrZXllZCBvbiBW
IHN1cHBvcnQsIGJ1dCBvbmx5IG9uIFp2ZTMyeC4KPiAKPiBUaGFua3MuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
