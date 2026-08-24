Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DA11C5DF9C
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Aug 2026 17:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1FfpCDDYa7lOJ0Um7tXbUQEQ9KBQFgNxhX6BQMvmHj0=; b=rVYEyFjWr/FBLV
	0sPbGXH+TSV5zj8iLXEaUG33QBWNKUPx99vaIRrEnJJssmRIAYw1ybCahHkpxlD7Lqz//Pjozv4b6
	4ab2BuHlmJhjT8S6MLFr/8uK2LgBdC61EW1lNtdfHZzKEF5SrZ+h/cTWlLQTmRdiszCikwitSmUqi
	FmEr+HDqpqwhPz6zrmVRGHvjyNNV+n+GKNXR2tcL6n0EsWkTO6eBhcVJ/Ahh9JSa5ARbrXqGJ4cH1
	zqAu/TxFOVneZR4z0IXdueAC5/zFUHmzyt33eVZHLItHpovpm5PMlGvRYAOLEzeW6II+JmG683Lsd
	lh6RZBTTdiX1RxcH26Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyYpO-0000000HDOb-0XYx;
	Mon, 24 Aug 2026 17:51:22 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyYpF-0000000HDND-3rEC
	for linux-riscv@lists.infradead.org;
	Mon, 24 Aug 2026 17:51:20 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-47f84023916so2618620f8f.3
        for <linux-riscv@lists.infradead.org>; Mon, 24 Aug 2026 10:51:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787593871; cv=none;
        d=google.com; s=arc-20260327;
        b=FV8QY0kSc7fzkXXW4ZAqhjrAjvO/YDLtZuYElG7HKkBvT4+uqdxPehwctG0nvIa5A7
         KGGVVfaTmFs5Yb/yhLLrh4pOqdwDvbvszGrTFx7XCh50czgoivehD6Os0B3Dk8Wxr1D3
         LYydxKs2oZbYR2eLO2B8R1eJlgdmoLG4HH4j2tcfBhOP0VjhQklbkzxICdz+t80pla5O
         zDa1tZTYfK81Jgk6++yNM/LQFsiOPqLKAn01IcZGx+egajdyiUpmt/ku1aSSKH+ZWukV
         BS/m4H5GwD1KfYFdfv8YarJS22ppX0CmWpEiZfVkcsERcSXltylhwJqkqBEopcTHNZ1M
         ZUHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=usCXM3LnOOf8/nc5h6U7TY2oa0VWqR/yP1WQ2SHQvZg=;
        fh=EJOmTSssJzcprt5tbQuRLORGbiIxILJ/Qa6bf70L/sU=;
        b=Ad8ufCzTakoZaxYj2B/7E2CRQOELyWLk/BQ5nVGK6B0N8/DC5aYFAxEGop4CW7XU3p
         EPubarJoaqfnw06FaSnJN71nilylLzDwJWF6sJfyo8FyaQkBPuocC7Hq1c80KRNF1lLt
         m91UYVPqIz0APRIvD55CSqMvN/D1hoaJyp0uANbsfbWk/JenpFV00mpPLG5qP0MEHL6G
         vDIQuQjpKBkdToqqXNinJQUs5DDoYVtpsnKa0iHLw6+Py1BP5m3z34n6BmXBfn+kd0bg
         W0ROg2RgEJ54Ucmwnx3pnxYaQf9c8CooufthGBKjrHIdXKSsi+/UWHGMgD8eRlI1U2Lt
         ESuw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1787593871; x=1788198671; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=usCXM3LnOOf8/nc5h6U7TY2oa0VWqR/yP1WQ2SHQvZg=;
        b=P+52sIZ7GiUdegpjBsNs0hYtZJqtB8frYJM7i2n7sldp9aa8zBStw/Aeldhc9s4ABM
         Ly3yo/aq8Az2veB66JT1BBuNCmKPIhTM4C6VXNSdc0ydpAqda0c4oY0Jw/2k2Q3ZmTTL
         taTC8/G+Ygeiahse/JSg9f/YG0o5l517pYYsyaNbkbAapUuCMAxKdMwIaTZiY6D5PrmT
         AgiCp4IQVg+HghDzQk6x39y3I8ZJh3+FYARiAIcS25dBYzW46g0B1IYIhBfs4tuHdBOG
         5/4xxmVZUpabnJB56zviOD0hstaNtrgGcORmnKQMJNzEl3G9ltBdGtLvV4Lw5CaTx+70
         yKow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787593871; x=1788198671;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=usCXM3LnOOf8/nc5h6U7TY2oa0VWqR/yP1WQ2SHQvZg=;
        b=bgnlIPAeIh7mMPZnSR4fyS9o41UKlRMUA2nIB2x3E6GYqatI9Km38Yv4xQGh+z4BoZ
         b/tYxgHrdLNryITzy1tdmstrR4QVSRzrl3j5YLGW2dYjiO3tEPX5BOiwSUGIVrs4a7Vs
         joxMFQzT+wgOcLkKDyGFYXlWevKEEmqedOhSnhX/N4ihxt1s1SDyV2VQPerrIU7iizBf
         kWtHEiWqUtgeELDdwpJ+GvFfDGwkt+IN0aaDezdXO9ncgfZuAWXwaJzk8tCUiXrxAdM/
         q4JWuIEWJHRdnyHdRSxmp3l75/R9/zniZI5/gwAitFw/ppi45GItArZH4SxoRaQS8G06
         6pfg==
X-Forwarded-Encrypted: i=1; AHgh+RpONEgBeVD1XielxDyNfUN3xRXxgj0Jabu5+AjMEDoEFFVzjrTOEz3v/kxi+pEaaISUR79mDuZfQ7Dgxg==@lists.infradead.org
X-Gm-Message-State: AFuF++kZaRIyGHoKpo59axcetItUVX6RqkzkP+3f8/TtWdIiz9gvMigK
	oGfVRNrpmssMAVIcjc6OvT6xKDy/3BRl/cVkWhgr9WjoYOlGMjl51ssTIkQKKFpxM3sXVdd8IqJ
	CGL1n2z3MbN/+al59QMv9kdNCCpLQA0iwW/11x4MTaA==
X-Gm-Gg: AR+sD10+208lra07BJAtOd8ZOfU8yS/gW/5Q/qbp69mSQD8u65R3ZqoxUwfOtMNz+zU
	/Wv55bBBivZV3jEsI+PEq5LDpzilRuA9cnRW9LhgPYMZPzjKQrehtVJA76U66Fig3PjN2Pv5De5
	4tcO6BwAVZYZeO+lFt8FZXR6gtM9h3GUZSNRE0oYtBQYr3gahVufRz/GieQBIp/p94yVO5JKPi/
	3fskYHJZogbMdLyJ4Unk0/qspa0RzvZ3Y+tf8XVp0Oyov5xmhSIhpMjHUATRcnbiHCsTYmN31pX
	MQQ19Nwj0jvXFzCKLfzxr8k8MWedyAPdukPRR4t3bc4jAOa92iKmI/tTwBCunRZzxVEm4EwV1TH
	S7+2CXHPgW8lzv+u+AImhnDyY4+c7JTLUXwMneibNHJ2iOm+32AjcsuzFk2j0DKiq
X-Received: by 2002:a05:6000:22c6:b0:47e:81aa:3832 with SMTP id
 ffacd0b85a97d-482c0b93991mr32458775f8f.16.1787593870823; Mon, 24 Aug 2026
 10:51:10 -0700 (PDT)
MIME-Version: 1.0
References: <20260823061053.543415-1-liutong@iscas.ac.cn>
In-Reply-To: <20260823061053.543415-1-liutong@iscas.ac.cn>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 24 Aug 2026 10:50:54 -0700
X-Gm-Features: AcwNN1UjLo03CjQnPsQSgFwXIkYkJcfWDzt3NxfYwO01-Es_Izw_EQJYrfMc8yo
Message-ID: <CAAhSdy37tQNRfdgkOrQK04XKXcOxmm5Mtrdsi-LvGua+e3rnnQ@mail.gmail.com>
Subject: Re: [PATCH] mailbox: riscv-sbi-mpxy: Validate notification data length
To: liutong <liutong@iscas.ac.cn>
Cc: Rahul Pathak <rpathak@ventanamicro.com>, Jassi Brar <jassisinghbrar@gmail.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_105116_446087_10AED4A9 
X-CRM114-Status: GOOD (  18.09  )
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

T24gU2F0LCBBdWcgMjIsIDIwMjYgYXQgMTE6MTHigK9QTSBsaXV0b25nIDxsaXV0b25nQGlzY2Fz
LmFjLmNuPiB3cm90ZToKPgo+IG1weHlfZ2V0X25vdGlmaWNhdGlvbnMoKSBjb3BpZXMgZGF0YSBm
cm9tIHNoYXJlZCBtZW1vcnkgdXNpbmcgYQo+IGxlbmd0aCBkZXJpdmVkIGZyb20gdGhlIFNCSSBy
ZXR1cm4gdmFsdWU6Cj4KPiAgIG1lbWNweShub3RpZl9kYXRhLCBtcHh5LT5zaG1lbSwgc3JldC52
YWx1ZSArIDE2KTsKPgo+IHNyZXQudmFsdWUgaXMgbm90IHZhbGlkYXRlZCBhZ2FpbnN0IHRoZSBz
aGFyZWQgbWVtb3J5IGJ1ZmZlciBzaXplLgo+IEEgYnVnZ3kgZmlybXdhcmUgcmV0dXJuaW5nIGEg
dmFsdWUgbGFyZ2VyIHRoYW4gbXB4eV9zaG1lbV9zaXplIC0gMTYKPiB3b3VsZCBjYXVzZSBtZW1j
cHkgdG8gcmVhZCBiZXlvbmQgdGhlIHNoYXJlZCBtZW1vcnkgbWFwcGluZy4KCldlbGwsIGlmIGEg
ZmlybXdhcmUgaXMgYnVnZ3kgdGhlbiBpdCBjYW4gY29ycnVwdCBhbnkgcGFydCBvZiB0aGUKUy1t
b2RlIG1lbW9yeSBhbmQgbm90IGp1c3QgdGhlIE1QWFkgc2hhcmVkIG1lbW9yeS4KCkkgdGhpbmsg
aXQgaXMgb2theSB0byBoYXZlIHRoaXMgYWRkaXRpb25hbCBjaGVjayBidXQgdGhpcyBkb2VzCm5v
dCBjb3ZlciBhbGwgcG9zc2libGUgY29ycnVwdGlvbnMgYnkgYnVnZ3kgZmlybXdhcmUuCgo+Cj4g
QWRkIGEgYm91bmRzIGNoZWNrIGJlZm9yZSB0aGUgbWVtY3B5Lgo+Cj4gRml4ZXM6IGJmMzAyMmE0
ZWIxMSAoIm1haWxib3g6IEFkZCBSSVNDLVYgU0JJIG1lc3NhZ2UgcHJveHkgKE1QWFkpIGJhc2Vk
IG1haWxib3ggZHJpdmVyIikKPiBTaWduZWQtb2ZmLWJ5OiBsaXV0b25nIDxsaXV0b25nQGlzY2Fz
LmFjLmNuPgoKUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CgpS
ZWdhcmRzLApBbnVwCgo+IC0tLQo+ICBkcml2ZXJzL21haWxib3gvcmlzY3Ytc2JpLW1weHktbWJv
eC5jIHwgNSArKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCj4KPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9tYWlsYm94L3Jpc2N2LXNiaS1tcHh5LW1ib3guYyBiL2RyaXZlcnMv
bWFpbGJveC9yaXNjdi1zYmktbXB4eS1tYm94LmMKPiBpbmRleCAxOGRhOWVmY2MuLjNhMmQ1MmJi
YyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL21haWxib3gvcmlzY3Ytc2JpLW1weHktbWJveC5jCj4g
KysrIGIvZHJpdmVycy9tYWlsYm94L3Jpc2N2LXNiaS1tcHh5LW1ib3guYwo+IEBAIC0zMTUsNiAr
MzE1LDExIEBAIHN0YXRpYyBpbnQgbXB4eV9nZXRfbm90aWZpY2F0aW9ucyh1MzIgY2hhbm5lbF9p
ZCwKPiAgICAgICAgIGlmIChzcmV0LmVycm9yKQo+ICAgICAgICAgICAgICAgICBnb3RvIGVycl9w
dXRfY3B1Owo+Cj4gKyAgICAgICBpZiAoc3JldC52YWx1ZSArIDE2ID4gbXB4eV9zaG1lbV9zaXpl
KSB7Cj4gKyAgICAgICAgICAgICAgIHB1dF9jcHUoKTsKPiArICAgICAgICAgICAgICAgcmV0dXJu
IC1FSU87Cj4gKyAgICAgICB9Cj4gKwo+ICAgICAgICAgbWVtY3B5KG5vdGlmX2RhdGEsIG1weHkt
PnNobWVtLCBzcmV0LnZhbHVlICsgMTYpOwo+ICAgICAgICAgKmV2ZW50c19kYXRhX2xlbiA9IHNy
ZXQudmFsdWU7Cj4KPiAtLQo+IDIuMzQuMQo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
