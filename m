Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F8D4C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Nov 2022 09:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6/JJb83/ilplGHEa3cfLWHgmV94O9t4QpBROLeCjJto=; b=pALo9cnib34d7a
	6TWrlQC0QyMCPmBeHawkacysXyFE/FRpeS28uywySqJ+F9TGX2U5QlSl/RQEuWKnqDd9fXxv7nz8c
	NGAzz9VAhsWyjN9SesVYBXA/sMvIOGXjwJoDNZq+DIXOI5oZXqOeHKuzJLkKxErBoxV4jl05Mc5me
	oYFdXEMRCSzpmB6Dvt9hkd9RTr3ZjSXq0iaGXetDHjsrP0tk4LgwdhHBjt1FSjXs0pY9PZU8ZnNIk
	sn2//NlZn0R24T9gKCcVowO8gzB4UwDNyt8RDACrkmZlFohtuWZrGcVcKheeuZzb77k2SByyJKhxK
	MaGvr6xxFK0ZfvUQ/3TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxPJm-006pYN-R6; Tue, 22 Nov 2022 09:11:50 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxPJk-006pWE-Tl
	for linux-riscv@lists.infradead.org; Tue, 22 Nov 2022 09:11:50 +0000
Received: by mail-pl1-x634.google.com with SMTP id d20so13014136plr.10
        for <linux-riscv@lists.infradead.org>; Tue, 22 Nov 2022 01:11:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JoTx9C4uNq1hBG7+PyDvIRzpdUCEux+gorC7Y4BuSig=;
        b=pKItYzsHtblDg17Omt9eVUAvCwzac4oqmR4KDXabuznIoYuqj4kdQ1H/EV0hs8btaL
         YtAvLpE2pNn8QeruD8M9mXRW8H7CXBGfB9brX8g6jgdykL8H+Aoa4BudOeXQYih/TPKI
         JZVkJX6fmFTJiDDXRRqFhIK4FVO4F2zmxnWr+Ll4p35JaXFPBM5iQ280KIkTug3CmjCT
         Vd2q2TKfZaR19wVH9Wco+5Z5buPmdSkDuiUsi8qxUWUgRwJbgYyGODMGtF0TWZjlvA4g
         BN8r+U7qcfyIo6WvSoRXX02XJ7kO0FgV4BHHfNMloxCR0rsXQVBxTAO4JPm9VxNZVRog
         Msug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JoTx9C4uNq1hBG7+PyDvIRzpdUCEux+gorC7Y4BuSig=;
        b=QCcOE7LRmBjL0Ycncs0RRC/57BX0mTtw75a7ZXaN0r6uPpu8zMEYbegb3zK3KRqiEH
         s3s/LxscHzy2W1lqMx1xKnTkHu/bMtmCWmBLWqI1rVO7WBQ2kqBvo6oMx0nPsd3osZUW
         2Eol0GV/5YdNLROCP8wGXN94hDFZ0bQGRkPVds1kRS5+4Pst4m1juamNisVgfvRxuIlA
         MN4N6aw8iqcVbn3hOz4Oog0DiebXnJvTBrUStgVYdcx594nAO6NT/IHd476kSxkq3Vwh
         D4OYsvrmrYyYfraMbH9k/1mbIX/p4lTRcyGHXCEiVYhchhjmpG7VbVG6/T6sF9jfKRNi
         bwbQ==
X-Gm-Message-State: ANoB5plRDTj9SQvzXFYHZUwu5HFl9yZDG0d/3ZNdTcE2BPQTNiLmNFId
	5O/reL9cVfYETz2/XfRL9ZvHVJMN2+wg0x6IM7Y=
X-Google-Smtp-Source: AA0mqf6VwG6QTTx5bieFy6M4a8Omoi5dC0LYHvGLNImoGL+M+vdrkKx82ONeT7MVjXNQSt3UyWfjJQscQQwM6arG93k=
X-Received: by 2002:a17:90a:dc06:b0:218:9196:1cd1 with SMTP id
 i6-20020a17090adc0600b0021891961cd1mr17572330pjv.230.1669108307219; Tue, 22
 Nov 2022 01:11:47 -0800 (PST)
MIME-Version: 1.0
References: <20221122075440.1165172-1-suagrfillet@gmail.com> <CAJF2gTQWuu2wUk-7WhFdov0PG5R1z_F_+OLqHM0nGnMiC1Yi_w@mail.gmail.com>
In-Reply-To: <CAJF2gTQWuu2wUk-7WhFdov0PG5R1z_F_+OLqHM0nGnMiC1Yi_w@mail.gmail.com>
From: Song Shuai <suagrfillet@gmail.com>
Date: Tue, 22 Nov 2022 09:11:34 +0000
Message-ID: <CAAYs2=iSTTuthLhwiyw08yG2q=yLrdKPmvbG2rS7uibzhe-wXQ@mail.gmail.com>
Subject: Re: [PATCH] riscv/ftrace: fix ftrace_modify_call bug
To: Guo Ren <guoren@kernel.org>
Cc: rostedt@goodmis.org, mhiramat@kernel.org, mark.rutland@arm.com, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221122_011149_003283_7150B9D8 
X-CRM114-Status: GOOD (  19.28  )
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

R3VvIFJlbiA8Z3VvcmVuQGtlcm5lbC5vcmc+IOS6jjIwMjLlubQxMeaciDIy5pel5ZGo5LqMIDA4
OjU35YaZ6YGT77yaCj4KPiBPbiBUdWUsIE5vdiAyMiwgMjAyMiBhdCAzOjU0IFBNIFNvbmcgU2h1
YWkgPHN1YWdyZmlsbGV0QGdtYWlsLmNvbT4gd3JvdGU6Cj4gPgo+ID4gV2l0aCB0aGlzIGNvbW1p
dCAocmlzY3Y6IGZ0cmFjZTogUmVkdWNlIHRoZSBkZXRvdXIgY29kZSBzaXplIHRvIGhhbGYpCj4g
PiBwYXRjaGVkLCBmdHJhY2UgYnVnIG9jY3VycmVkIFdoZW4gaG9zdGluZyBrcHJvYmUgYW5kIGZ1
bmN0aW9uIHRyYWNlcgo+ID4gYXQgdGhlIHNhbWUgZnVuY3Rpb24uCj4gPgo+ID4gT2J2aW91c2x5
LCB0aGUgdmFyaWFibGUgY2FsbGVyIGluIGZ0cmFjZV9tb2RpZnlfY2FsbCB3YXMgYXNzaWduZWQg
YnkKPiA+IHJlYy0+aXAgd2l0aCA0IG9mZnNldCBmYWlsaW5nIHRoZSBjb2RlIHJlcGxhY2luZyBh
dCBmdW5jdGlvbiBlbnRyeS4KPiA+IEFuZCB0aGUgY2FsbGVyIHNob3VsZCBiZSBhc3NpZ25lZCBi
eSByZWMtPmlwIGRpcmVjdGx5IHRvIGluZGljYXRlCj4gPiB0aGUgZnVuY3Rpb24gZW50cnkuCj4g
VGhhbmsgeW91LCBpdCdzIG15IGZhdWx0LCBidXQgSSB0aGluayB0aGUgcHJvYmxlbSBpczoKPgo+
IEJlZm9yZSAocmlzY3Y6IGZ0cmFjZTogUmVkdWNlIHRoZSBkZXRvdXIgY29kZSBzaXplIHRvIGhh
bGYpCj4gICAgICAwOiBSRUdfUyAgcmEsIC1TWlJFRyhzcCkKPiAgICAgIDQ6IGF1aXBjICByYSwg
PyAgICAgICAgICA8LSBXZSBuZWVkICJyZWMtPmlwICsgNCIgaGVyZQo+ICAgICAgODogamFsciAg
ID8ocmEpCj4gICAgIDEyOiBSRUdfTCAgcmEsIC1TWlJFRyhzcCkKPgo+IEFmdGVyIChyaXNjdjog
ZnRyYWNlOiBSZWR1Y2UgdGhlIGRldG91ciBjb2RlIHNpemUgdG8gaGFsZikKPiAgICAgIDA6IGF1
aXBjICB0MCwgPyAgPC0gV2UgbmVlZG4ndCAicmVjLT5pcCArIDQiIGFueW1vcmUKPiAgICAgIDQ6
IGphbHIgICB0MCwgPyh0MCkKPgo+IEkgY29waWVkIHJlYy0+aXAgKyA0IGJsaW5kbHksIHRoZW4g
Y2F1c2VkIHRoZSBidWcuIFJpZ2h0Pwo+ClllcywgeW91J3JlIHJpZ2h0LgoKSGVyZSdzIG15IHNp
bXBsZSB0ZXN0IGNhc2UgZm9yIHlvdXIgY29udmVuaWVuY2UuCmBgYAplY2hvIGtlcm5lbF9yZWFk
ID4gc2V0X2Z0cmFjZV9maWx0ZXIKZWNobyBmdW5jdGlvbiA+IGN1cnJlbnRfdHJhY2VyCmVjaG8g
J3A6bXlwIGtlcm5lbF9yZWFkJyA+IGtwcm9iZV9ldmVudHMKZWNobyAxID4gZXZlbnRzL2twcm9i
ZXMvbXlwL2VuYWJsZSAjIGZ0cmFjZSBidWcKYGBgCj4gPgo+ID4gVGhlIGZvbGxvd2luZyBpcyB0
aGUgZnRyYWNlIGJ1ZyBsb2cuCj4gPgo+ID4gYGBgCj4gPiBbICA0MTkuNjMyODU1XSAwMDAwMDAw
MGY4Nzc2ODAzOiBleHBlY3RlZCAoZmZlMDAyOTcgMWE0MjgyZTcpIGJ1dCBnb3QgKDFhODI4MmU3
IGYwMjI3MTc5KQo+ID4gWyAgNDE5LjYzMzM5MF0gLS0tLS0tLS0tLS0tWyBmdHJhY2UgYnVnIF0t
LS0tLS0tLS0tLS0KPiA+IFsgIDQxOS42MzM1NTNdIGZ0cmFjZSBmYWlsZWQgdG8gbW9kaWZ5Cj4g
PiBbICA0MTkuNjMzNTY5XSBbPGZmZmZmZmZmODAyMDkxY2M+XSBrZXJuZWxfcmVhZCsweDAvMHg1
Mgo+ID4gWyAgNDE5LjYzMzg2M10gIGFjdHVhbDogICA5NzowMjplMDpmZjplNzo4Mjo4MjoxYQo+
ID4gWyAgNDE5LjYzNDA4N10gVXBkYXRpbmcgZnRyYWNlIGNhbGwgc2l0ZSB0byBjYWxsIGEgZGlm
ZmVyZW50IGZ0cmFjZSBmdW5jdGlvbgo+ID4gWyAgNDE5LjYzNDI3OV0gZnRyYWNlIHJlY29yZCBm
bGFnczogZTAwMDAwMDIKPiA+IFsgIDQxOS42MzQ0ODddICAoMikgUgo+ID4gWyAgNDE5LjYzNDQ4
N10gIGV4cGVjdGVkIHRyYW1wOiBmZmZmZmZmZjgwMDA5M2NjCj4gPiBbICA0MTkuNjM0OTM1XSAt
LS0tLS0tLS0tLS1bIGN1dCBoZXJlIF0tLS0tLS0tLS0tLS0KPiA+IGBgYAo+ID4KPiA+IFNpZ25l
ZC1vZmYtYnk6IFNvbmcgU2h1YWkgPHN1YWdyZmlsbGV0QGdtYWlsLmNvbT4KPiA+IC0tLQo+ID4g
IGFyY2gvcmlzY3Yva2VybmVsL2Z0cmFjZS5jIHwgMiArLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jp
c2N2L2tlcm5lbC9mdHJhY2UuYyBiL2FyY2gvcmlzY3Yva2VybmVsL2Z0cmFjZS5jCj4gPiBpbmRl
eCA4Yzc3ZjIzNmZjNzEuLjYxYjI0ZDc2N2UyZSAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3Yv
a2VybmVsL2Z0cmFjZS5jCj4gPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9mdHJhY2UuYwo+ID4g
QEAgLTEzMiw3ICsxMzIsNyBAQCBpbnQgZnRyYWNlX21vZGlmeV9jYWxsKHN0cnVjdCBkeW5fZnRy
YWNlICpyZWMsIHVuc2lnbmVkIGxvbmcgb2xkX2FkZHIsCj4gPiAgICAgICAgICAgICAgICAgICAg
ICAgIHVuc2lnbmVkIGxvbmcgYWRkcikKPiA+ICB7Cj4gPiAgICAgICAgIHVuc2lnbmVkIGludCBj
YWxsWzJdOwo+ID4gLSAgICAgICB1bnNpZ25lZCBsb25nIGNhbGxlciA9IHJlYy0+aXAgKyA0Owo+
ID4gKyAgICAgICB1bnNpZ25lZCBsb25nIGNhbGxlciA9IHJlYy0+aXA7Cj4gPiAgICAgICAgIGlu
dCByZXQ7Cj4gPgo+ID4gICAgICAgICBtYWtlX2NhbGxfdDAoY2FsbGVyLCBvbGRfYWRkciwgY2Fs
bCk7Cj4gPiAtLQo+ID4gMi4yMC4xCj4gPgo+Cj4KPiAtLQo+IEJlc3QgUmVnYXJkcwo+ICBHdW8g
UmVuClRoYW5rcywKU29uZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
