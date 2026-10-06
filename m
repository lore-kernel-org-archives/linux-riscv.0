Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CC46CA5FED
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Oct 2026 23:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M8WkKh+usZS/a3st23wxWHUJqOKntjg/f8OlAK0bXqA=; b=4jwujyjAAef5ID
	sA6Mv6WoJNBx2efcdghYczuk/GQpJGfvroIOCaEfTQVVCHZCTqOviPcdY61Kil47mqioK4dVkm8IO
	gD/BZ4wqataKVDZHyo6rRlEzRT0PqaRCeyIE+fo8sQbfTD6EjShv/wgjV7nUNqzuS4kmEVV+eAbJR
	ZtRGRq6YHWp/bjZUuoS/7Gx/FumZ9CZ+pES5FYhAAdCkxnQq0EH8XlJb8l/ecb/0vQ+5OxwLaGw1A
	4Y33E6AcbFyDlR+8qpyGrSfeoRmPeWxfTt1NIhUL1WLlpZTGZXxO1BUaji6G6k98OD5loUCfVx4Qt
	ibMuhkLJ+VY0jiQG4UmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEEzw-00000001Vz3-2GQK;
	Tue, 06 Oct 2026 23:55:04 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEEzu-00000001VyN-0rcM
	for linux-riscv@lists.infradead.org;
	Tue, 06 Oct 2026 23:55:03 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4a018792ab3so12117915e9.0
        for <linux-riscv@lists.infradead.org>; Tue, 06 Oct 2026 16:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791330900; x=1791935700; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6caTqpTyvHD+5gas9OwUK4EamiM1ZGZZvDW5j5iNI9E=;
        b=BS1hnfRXjzWN+uayryys8Acq8JIxRyE1bQWY/NCR11CQsCLIn7+Xc3P9L7D4SxkgY5
         unin4avdj4pqbNrdYghTwMQzjCeemtWzN1zwR5suA1OMYFjqWwycd4eDJ/wm41AbMo/W
         rz4B5sz19lEZQWL2ZAYpFfQGIMUjwTdxnYXHwVoKhgYzopq0tNWRUIqDJzTkMclyfB+U
         /3xhYQosKtgVzJltDKlEvKKCiOa9pRFWIFRvNmkrKsYvCU5EGAP56I47pMz5LFC/iZ+/
         v9oTqxjXmRdcGK3Rpe/01iDyJKW22K1Bpyj3tkOc/3yW5poPqN/ozovGMRSK2H5V9FJ4
         g43w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791330900; x=1791935700;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6caTqpTyvHD+5gas9OwUK4EamiM1ZGZZvDW5j5iNI9E=;
        b=jzr1FHwry0CsXDX1f2LEcgEzKgALglWOw0GiefiY3+rx23Bbvq1z5vHGcxy7VVUtA8
         7vd3LLI4GGrPKB/TRXuGkg+5g0xwZrmEjMwD92q1ScnOcRcBMUBa2EHPQQdSpyF33FfK
         4OFdgX35rmGl6EZGUaxo2aR58S6wdzmdNiQ3PFZPfQLpAPVNnm16Z6JLQDn0ge4tKg8v
         eRXNvqMVN2kdX30JL3HMxhdbaQfXP/WPNgnl+nDQn+qz6XQoauB372crDmiRiMwFWRxw
         YQvO6oEQl+2vmoElL1Bf1Rw/ZIXExhkP1bdmACHEMYaWGsjLvei54vPPv8bDUHByBqdb
         JtVA==
X-Gm-Message-State: AFuF++nJH3FlgUblFFY/YUlHSgcf6zxWKYcmhcD198qaXCXAlZFcGuA/
	6BzFw3UnvkoCYznWq5DO3FYX/33HFdMFGcv19V5u8hZhUxV2Mj/boadj
X-Gm-Gg: AYBFou01uBLC2INHA96wdlciBL6Uph4MMbycmHcoI5xzGm93Z/8av9gWyBcwq1KRsMY
	gqk1oXa8KN6HF7jZYzzk22Ez76LrwZ2Qxp36rDAdCSBqe3skPNj980tPhbXsxiAU7kAsvoFG2DL
	bUtn5znrAc5gfc9/kzx11VrmabrSPLOBYfJmZErX/iLQPOkOaHNnd9OydO28IzYHBPVMcOD3LHl
	l2YnZ7qUAgdO68h83FkzJBXjB5Dgw38yyLP8mhEZgEeNMpArV00ojvaFV6GzPgbxPo5Ej1aAExh
	4kUSnQC8Q0k3+wgijz+N4JzXwliI6L9OCuj2ilkMi6h9aHGTQl8XNYzU5Ij5pYs+6N16s4vvZsI
	5gNOTj448JF5VtACmMeV0c1V5bnjIInI56xcdoIbxz8pQWLK3zwpzGaTinLCJYXydeU7FcU5BOA
	5lAGYyx80qzbLOXfuWgAG0reX4xkU/LCYsd7rr+xsLWYIh2L6xwrVT1J2ImSYHPjaxtu6iRumQi
	sCneLmi4b1bMnIeksipwkQ6uLciYXFk38ydz8xj7e6xzQ==
X-Received: by 2002:a05:600c:3c89:b0:499:8aff:59b6 with SMTP id 5b1f17b1804b1-4a18041b75amr5330465e9.14.1791330900202;
        Tue, 06 Oct 2026 16:55:00 -0700 (PDT)
Received: from [192.168.221.223] ([81.0.216.212])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1787e7792sm102154535e9.0.2026.10.06.16.54.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 16:54:58 -0700 (PDT)
MIME-Version: 1.0
Subject: Re: [PATCH 1/6] riscv: hwprobe: Report FP extensions only when
 available
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
To: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <radim.krcmar@oss.qualcomm.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alexandre Ghiti <alex@ghiti.fr>, Samuel Holland <samuel.holland@sifive.com>, 
 Andy Chiu <andybnac@gmail.com>, Guodong Xu <guodong@riscstar.com>, 
 Zong Li <zong.li@sifive.com>, Charlie Jenkins <thecharlesjenkins@gmail.com>
In-Reply-To: <20261006075303.205216-2-radim.krcmar@oss.qualcomm.com>
References: <20261006075303.205216-1-radim.krcmar@oss.qualcomm.com>
 <20261006075303.205216-2-radim.krcmar@oss.qualcomm.com>
Date: Tue, 06 Oct 2026 16:54:53 -0700
Message-Id: <179133089395.137225.157195939155119911.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791330897; l=2848;
 i=thecharlesjenkins@gmail.com; s=20260605; h=from:subject:message-id;
 bh=9px0KKW6+S6ScpCVxlEJlJB8scT76HzwC5B67rbvQqU=;
 b=IXpSMuCwkwGtNWcB7512IaSVcHgJ+fHhO6oesNjxGTtxqvfRZo5010Ya/IUUAm0m6WTneDU0U
 7fvpY2pUXB9Agq9hTCrj6KqydJ8MqYBgJRDet0FngldtFfBWReUK8Uw
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=ajnnRQ98PIdwKp4HeMkq9U32okYbnh6Zb4G3o5XXvkg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_165502_269218_55630E6C 
X-CRM114-Status: GOOD (  13.76  )
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

PiBVc2VyLW1vZGUgdXNlIG9mIFpjZCwgWmNmLCBaZmEsIFpmYmZtaW4sIFpmaCBhbmQgWmZobWlu
IHJlcXVpcmVzCj4gbm9uLU9mZiBzc3RhdHVzLkZTLCB3aGljaCB3ZSBzZXQgb25seSB3aGVuIGhh
c19mcHUoKSAoQ09ORklHX0ZQVSBhbmQgRAo+IG9uIGFsbCBoYXJ0cykuICBUaGUgdmVjdG9yIGZs
b2F0aW5nLXBvaW50IGV4dGVuc2lvbnMgWnZlMzJmLCBadmU2NGYsCj4gWnZlNjRkLCBadmZiZm1p
biwgWnZmYmZ3bWEsIFp2ZmggYW5kIFp2ZmhtaW4gcmVxdWlyZSBpdCBhcyB3ZWxsLCBidXQKPiBo
d3Byb2JlIGdhdGVzIHRoZW0gb25seSBvbiBoYXNfdmVjdG9yKCkuICBod3Byb2JlIG90aGVyd2lz
ZSByZXBvcnRzIHRoZQo+IGV4dGVuc2lvbnMgZnJvbSB0aGUgcGVyLWhhcnQgSVNBIGJpdG1hcHMg
YWxvbmUsIHNvIGl0IGNhbiBhZHZlcnRpc2UKPiBleHRlbnNpb25zIHRoYXQgYXJlIGFsd2F5cyBk
aXNhYmxlZCBpbiB1c2VyLW1vZGUuCj4gCj4gUmVwb3J0IGNvcnJlY3QgZW52aXJvbm1lbnQgdG8g
dXNlci1tb2RlLgo+IAo+IEZpeGVzOiAyZTJjZjU1ODFmY2MgKCJyaXNjdjogY3B1ZmVhdHVyZTog
YWRkIHZhbGlkYXRpb24gZm9yIHpmYSwgemZoIGFuZCB6ZmhtaW4iKQo+IEZpeGVzOiBkZThmODI4
MmE5NjkgKCJyaXNjdjogaHdwcm9iZTogYWRkIHp2ZSBWZWN0b3Igc3ViZXh0ZW5zaW9ucyBpbnRv
IGh3cHJvYmUgaW50ZXJmYWNlIikKPiBGaXhlczogNWRhZGRhNWU2YTU5ICgicmlzY3Y6IGh3cHJv
YmU6IGV4cG9ydCBadmZoW21pbl0gSVNBIGV4dGVuc2lvbnMiKQo+IFNpZ25lZC1vZmYtYnk6IFJh
ZGltIEtyxI1tw6HFmSA8cmFkaW0ua3JjbWFyQG9zcy5xdWFsY29tbS5jb20+Cj4KPiBkaWZmIC0t
Z2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvc3lzX2h3cHJvYmUuYyBiL2FyY2gvcmlzY3Yva2VybmVs
L3N5c19od3Byb2JlLmMKPiBpbmRleCA3ODE4ZTFkMzI2MjIuLmI1N2NjZDExNmJiMSAxMDA2NDQK
PiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNfaHdwcm9iZS5jCj4gKysrIGIvYXJjaC9yaXNj
di9rZXJuZWwvc3lzX2h3cHJvYmUuYwo+IEBAIC0xNDYsMTUgKzE0Niw4IEBAIHN0YXRpYyB2b2lk
IGh3cHJvYmVfaXNhX2V4dDAoc3RydWN0IHJpc2N2X2h3cHJvYmUgKnBhaXIsCj4gIAkJaWYgKGhh
c192ZWN0b3IoKSkgewo+ICAJCQlFWFRfS0VZKGlzYWluZm8tPmlzYSwgWlZCQiwgcGFpci0+dmFs
dWUsIG1pc3NpbmcpOwo+ICAJCQlFWFRfS0VZKGlzYWluZm8tPmlzYSwgWlZCQywgcGFpci0+dmFs
dWUsIG1pc3NpbmcpOwo+IC0JCQlFWFRfS0VZKGlzYWluZm8tPmlzYSwgWlZFMzJGLCBwYWlyLT52
YWx1ZSwgbWlzc2luZyk7Cj4gIAkJCUVYVF9LRVkoaXNhaW5mby0+aXNhLCBaVkUzMlgsIHBhaXIt
PnZhbHVlLCBtaXNzaW5nKTsKPiAtCQkJRVhUX0tFWShpc2FpbmZvLT5pc2EsIFpWRTY0RCwgcGFp
ci0+dmFsdWUsIG1pc3NpbmcpOwo+IC0JCQlFWFRfS0VZKGlzYWluZm8tPmlzYSwgWlZFNjRGLCBw
YWlyLT52YWx1ZSwgbWlzc2luZyk7Cj4gIAkJCUVYVF9LRVkoaXNhaW5mby0+aXNhLCBaVkU2NFgs
IHBhaXItPnZhbHVlLCBtaXNzaW5nKTsKPiAtCQkJRVhUX0tFWShpc2FpbmZvLT5pc2EsIFpWRkJG
TUlOLCBwYWlyLT52YWx1ZSwgbWlzc2luZyk7Cj4gLQkJCUVYVF9LRVkoaXNhaW5mby0+aXNhLCBa
VkZCRldNQSwgcGFpci0+dmFsdWUsIG1pc3NpbmcpOwo+IC0JCQlFWFRfS0VZKGlzYWluZm8tPmlz
YSwgWlZGSCwgcGFpci0+dmFsdWUsIG1pc3NpbmcpOwo+IC0JCQlFWFRfS0VZKGlzYWluZm8tPmlz
YSwgWlZGSE1JTiwgcGFpci0+dmFsdWUsIG1pc3NpbmcpOwo+ICAJCQlFWFRfS0VZKGlzYWluZm8t
PmlzYSwgWlZLQiwgcGFpci0+dmFsdWUsIG1pc3NpbmcpOwo+ICAJCQlFWFRfS0VZKGlzYWluZm8t
PmlzYSwgWlZLRywgcGFpci0+dmFsdWUsIG1pc3NpbmcpOwo+ICAJCQlFWFRfS0VZKGlzYWluZm8t
PmlzYSwgWlZLTkVELCBwYWlyLT52YWx1ZSwgbWlzc2luZyk7Cj4gQEAgLTE2MywxNCArMTU2LDI2
IEBAIHN0YXRpYyB2b2lkIGh3cHJvYmVfaXNhX2V4dDAoc3RydWN0IHJpc2N2X2h3cHJvYmUgKnBh
aXIsCj4gIAkJCUVYVF9LRVkoaXNhaW5mby0+aXNhLCBaVktTRUQsIHBhaXItPnZhbHVlLCBtaXNz
aW5nKTsKPiAgCQkJRVhUX0tFWShpc2FpbmZvLT5pc2EsIFpWS1NILCBwYWlyLT52YWx1ZSwgbWlz
c2luZyk7Cj4gIAkJCUVYVF9LRVkoaXNhaW5mby0+aXNhLCBaVktULCBwYWlyLT52YWx1ZSwgbWlz
c2luZyk7Cj4gKwo+ICsJCQlpZiAoaGFzX2ZwdSgpKSB7Cj4gKwkJCQlFWFRfS0VZKGlzYWluZm8t
PmlzYSwgWlZFMzJGLCBwYWlyLT52YWx1ZSwgbWlzc2luZyk7Cj4gKwkJCQlFWFRfS0VZKGlzYWlu
Zm8tPmlzYSwgWlZFNjRELCBwYWlyLT52YWx1ZSwgbWlzc2luZyk7Cj4gKwkJCQlFWFRfS0VZKGlz
YWluZm8tPmlzYSwgWlZFNjRGLCBwYWlyLT52YWx1ZSwgbWlzc2luZyk7Cj4gKwkJCQlFWFRfS0VZ
KGlzYWluZm8tPmlzYSwgWlZGQkZNSU4sIHBhaXItPnZhbHVlLCBtaXNzaW5nKTsKPiArCQkJCUVY
VF9LRVkoaXNhaW5mby0+aXNhLCBaVkZCRldNQSwgcGFpci0+dmFsdWUsIG1pc3NpbmcpOwo+ICsJ
CQkJRVhUX0tFWShpc2FpbmZvLT5pc2EsIFpWRkgsIHBhaXItPnZhbHVlLCBtaXNzaW5nKTsKPiAr
CQkJCUVYVF9LRVkoaXNhaW5mby0+aXNhLCBaVkZITUlOLCBwYWlyLT52YWx1ZSwgbWlzc2luZyk7
CgpUaGUgdmVjdG9yIEtjb25maWcgaXMgZ2F0ZWQgb24gRlBVPXkgc28gdGhlIHZlY3RvciBpbnN0
cnVjdGlvbnMgY2FuJ3QKZXZlciBiZSBlbmFibGVkIHdoZW4gRlBVPW4uCgotLSAKLSBDaGFybGll
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
