Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ECFECA6002
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Oct 2026 23:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ngcBCmWiGVFTQmRx/BEhmG4mzq6w88ZPXlpObSBnhWA=; b=4sBXzwWTcn+TuW
	k2ciBuHoF1Krx3MDhygYO7IPwfNZWi/5NtojTgadywTn2OlG3g6ktwOArSVK6SP0vghuyajfaH0vt
	CXmru1M9hC6V/MngWchJPxwoLjuH1H/jAxYx8n3riYeH5WWDnqT2dowEAMOk4rdlNRuHzzR2doM0r
	lZRwluqqQl+b49Ju4SHXLTKXv5bAZK7rMVjFSu9SMZ7WSnc/QTUOF9h0bjUGiJjKI3yJJEQm0c6pT
	eUlnZ5BSxtHcP71xvgC1yJC37rYfb1M2macRe2EByO/KpBl4TeDzsB7PX+rBG0Wy/BCYhMqXtz+XP
	wavE3IbwsT7V6L/IsSSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEF00-00000001Vzz-2hHc;
	Tue, 06 Oct 2026 23:55:08 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEEzy-00000001Vz8-46Jq
	for linux-riscv@lists.infradead.org;
	Tue, 06 Oct 2026 23:55:08 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-48c45111bebso854766f8f.0
        for <linux-riscv@lists.infradead.org>; Tue, 06 Oct 2026 16:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791330905; x=1791935705; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Hc8zFHX/H3Z04+Mk8kD0wTP8j4BgYHlZDrRkuIKnqUk=;
        b=O5B63wqm4+zlH056zy+DYkZG/45F82ZpXPRjhtfx0QfHGPkkgnq/5my3rZAjj3jyRW
         Ak0jX0yAFkRS3Lj+5rMnhjPstjxkAYIML88d8CbC6bRTsFtLJLGI17MRAMJnn81bjByL
         J8t/Xb5mvd0fkUvOMrDQh5t75YYaUQ+/1XfBdaqjOv+61gJJae4pZ90ivu/dm651fi2U
         zKTnHfs2mi0iiYCM3iNpOpcXCFUy8U4LGu2O1q5i7Oz2AK12BkJEapdeNCjwMLz+KEh/
         Ug7dQP5hru1E5QmvA9OEC/gUQKgs6d8juzGCaBpMf3fUGYxRnSn7ZaXEcaQT7mgtruun
         4QzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791330905; x=1791935705;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hc8zFHX/H3Z04+Mk8kD0wTP8j4BgYHlZDrRkuIKnqUk=;
        b=kQeMGfCWtbKb2CwELrDbrkCUWLn3WKGCd2FFl5Y7m1ZVhETN4QMFcyMfzVJF4O8mUS
         gvjC95I+NNcT3aLAq3wR/aZQsWk4/7WPR+YarqcBWaKKt5vZdA1/6xiQI/5As3jdIyEB
         WnzE1I++P5CjSSF0mXFGt9UGjZXroeOe1baJpEO0xHpyFrITSJYKTZJ54KhobG4+UFm3
         sLm2w3+lRjuSo6IZdu2GV5Aj0lxHSfIUhe3wvj5QKiHkCZkjrcDeVoZP71TnKPXgf8KX
         z7yFLS/UDNwimxxyZgfNOmdke0wFbP1pT4tzXlgY7S+2cbmMdvCtSuVNm5AnYICwZKyJ
         f9yQ==
X-Gm-Message-State: AFuF++lzdIWjJN1HFR/nQezZ3QnY3jWsP0FIveE6V9KOnNJl/e6lYbS7
	SVrFBWal5dRv6sI7ZZqAOTXUxW4WY5HNg8CJHMmMFU2BTTc6vJbE74g8
X-Gm-Gg: AYBFou21nhBkd2Uudj2SW7P/fRwrVOTK7XCipF/Vo9eDB3yM93F1d9+6+eLn9vWkX6U
	FNQZuoJLtHs4eFxd257Lh/0Bv+Ael6P/8B1MPTn2s6xxJablsC6IeBe+RNgOGc0WCTsmXMoBp1I
	oAdetb6PwvWyQtzYzQzOgeqAjFVDHPd5fMAhMY/y0U4RiWppO19eMfPzlTjmW14byV4S58WF3sL
	qXkY915BIICV0quDVnv4eH6mm7gKjOeUTw5TaG8047NgVPf3Yf4T5xM4gvRaTsHsyd/c3qCrRbC
	aOV63fegasQGm4yT3lK55Z06rn527TLoEHOJJJedpKaXWjcGZC4HOCcnw4N/S1zS6F8kzXcMeom
	onScRNBCT0l/0Wo5u4qw1Z2mjgn6VJTbiemXXoBihxQXpHjVLLTHmRid/aR2oicn8gFsA49yaZ4
	a/h+GhB87Q9yF3EuV8zbAgYX/2Dem4lojES3Im/quWcHksrxsROeN3HIzW1foMh6uTxqOgehrcx
	I4qjoUrCJWFRB/8iz2ct9TPe9RGj7rAnEwpSypHXLHy+w==
X-Received: by 2002:a05:600c:5254:b0:4a0:1b15:8852 with SMTP id 5b1f17b1804b1-4a180310d31mr5486895e9.16.1791330904950;
        Tue, 06 Oct 2026 16:55:04 -0700 (PDT)
Received: from [192.168.221.223] ([81.0.216.212])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1787e7792sm102154535e9.0.2026.10.06.16.55.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 16:55:01 -0700 (PDT)
MIME-Version: 1.0
Subject: Re: [PATCH 5/6] riscv: hwprobe: Report XTheadVector only when
 available
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
To: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <radim.krcmar@oss.qualcomm.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alexandre Ghiti <alex@ghiti.fr>, Samuel Holland <samuel.holland@sifive.com>, 
 Andy Chiu <andybnac@gmail.com>, Guodong Xu <guodong@riscstar.com>, 
 Zong Li <zong.li@sifive.com>, Charlie Jenkins <thecharlesjenkins@gmail.com>
In-Reply-To: <20261006075303.205216-6-radim.krcmar@oss.qualcomm.com>
References: <20261006075303.205216-1-radim.krcmar@oss.qualcomm.com>
 <20261006075303.205216-6-radim.krcmar@oss.qualcomm.com>
Date: Tue, 06 Oct 2026 16:54:53 -0700
Message-Id: <179133089395.137225.16486951642128892687.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791330897; l=1649;
 i=thecharlesjenkins@gmail.com; s=20260605; h=from:subject:message-id;
 bh=Qss2ojHxn+0sL9+n2p/yEGf54S/LdwCMSlTlBjccvuU=;
 b=QnjYYd2HuP0BTDKdLSAOgOIcmv68bMm581AJecHDSqgnAtDJ2LizBYt2VMgfGDpp2rmBvD/Bl
 SWhayfIbCaFAiaKfdHXaanweBUt900Ie+QcwWtcQEp7YNowbXP96WLd
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=ajnnRQ98PIdwKp4HeMkq9U32okYbnh6Zb4G3o5XXvkg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_165507_043816_3A13F60E 
X-CRM114-Status: GOOD (  12.86  )
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

PiBVc2VyLW1vZGUgdXNlIG9mIFhUaGVhZFZlY3RvciByZXF1aXJlcyBub24tT2ZmIHNzdGF0dXMu
VlMsIHdoaWNoIHdlIHNldAo+IG9ubHkgd2hlbiBoYXNfeHRoZWFkdmVjdG9yKCkgKENPTkZJR19S
SVNDVl9JU0FfWFRIRUFEVkVDVE9SIGFuZAo+IFhUaGVhZFZlY3RvciBvbiBhbGwgaGFydHMpLiAg
WFRoZWFkVmVjdG9yIGFsc28gYnVuZGxlcyBvcGVyYXRpb25zIHdpdGgKPiBmbG9hdGluZyBzdGF0
ZSwgd2hpY2ggYWRkaXRpb25hbGx5IHJlcXVpcmVzIG5vbi1PZmYgc3N0YXR1cy5GUyBhbmQgaGVu
Y2UKPiBoYXNfZnB1KCkuICBod3Byb2JlIHJlcG9ydHMgWFRoZWFkVmVjdG9yIGZyb20gdGhlIHBl
ci1oYXJ0IHZlbmRvciBJU0EKPiBiaXRtYXBzIGFsb25lLCBzbyBpdCBjYW4gYWR2ZXJ0aXNlIGFu
IGV4dGVuc2lvbiB0aGF0IGlzIGFsd2F5cyBkaXNhYmxlZAo+IGluIHVzZXItbW9kZS4KPiAKPiBS
ZXBvcnQgY29ycmVjdCBlbnZpcm9ubWVudCB0byB1c2VyLW1vZGUuCj4gCj4gRml4ZXM6IGE1ZWE1
M2RhNjVjNSAoInJpc2N2OiBod3Byb2JlOiBBZGQgdGhlYWQgdmVuZG9yIGV4dGVuc2lvbiBwcm9i
aW5nIikKPiBTaWduZWQtb2ZmLWJ5OiBSYWRpbSBLcsSNbcOhxZkgPHJhZGltLmtyY21hckBvc3Mu
cXVhbGNvbW0uY29tPgo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3ZlbmRvcl9l
eHRlbnNpb25zL3RoZWFkX2h3cHJvYmUuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3ZlbmRvcl9leHRl
bnNpb25zL3RoZWFkX2h3cHJvYmUuYwo+IGluZGV4IDJlYmEzNDAxMTc4Ni4uZjA3YWExYzhhY2Fj
IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3ZlbmRvcl9leHRlbnNpb25zL3RoZWFk
X2h3cHJvYmUuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3ZlbmRvcl9leHRlbnNpb25zL3Ro
ZWFkX2h3cHJvYmUuYwo+IEBAIC0xLDUgKzEsNyBAQAo+ICAvLyBTUERYLUxpY2Vuc2UtSWRlbnRp
ZmllcjogR1BMLTIuMC1vbmx5Cj4gIAo+ICsjaW5jbHVkZSA8YXNtL3N3aXRjaF90by5oPgo+ICsj
aW5jbHVkZSA8YXNtL3ZlY3Rvci5oPgo+ICAjaW5jbHVkZSA8YXNtL3ZlbmRvcl9leHRlbnNpb25z
L3RoZWFkLmg+Cj4gICNpbmNsdWRlIDxhc20vdmVuZG9yX2V4dGVuc2lvbnMvdGhlYWRfaHdwcm9i
ZS5oPgo+ICAjaW5jbHVkZSA8YXNtL3ZlbmRvcl9leHRlbnNpb25zL3ZlbmRvcl9od3Byb2JlLmg+
Cj4gQEAgLTE0LDYgKzE2LDcgQEAgdm9pZCBod3Byb2JlX2lzYV92ZW5kb3JfZXh0X3RoZWFkXzAo
c3RydWN0IHJpc2N2X2h3cHJvYmUgKnBhaXIsIGNvbnN0IHN0cnVjdCBjcHUKPiAgewo+ICAJVkVO
RE9SX0VYVEVOU0lPTl9TVVBQT1JURUQocGFpciwgY3B1cywKPiAgCQkJCSAgIHJpc2N2X2lzYV92
ZW5kb3JfZXh0X2xpc3RfdGhlYWQucGVyX2hhcnRfaXNhX2JpdG1hcCwgewo+IC0JCVZFTkRPUl9F
WFRfS0VZKFhUSEVBRFZFQ1RPUik7Cj4gKwkJaWYgKGhhc194dGhlYWR2ZWN0b3IoKSAmJiBoYXNf
ZnB1KCkpCgp4dGhlYWR2ZWN0b3IgaXMgYWxzbyBnYXRlZCBvbiBGUFU9eSBzbyB0aGlzIGlzIGEg
cmVkdW50YW50IGFkZGl0aW9uLiBJcwppdCB3b3J0aHdoaWxlIHRvIG1ha2UgdGhpcyBjaGFuZ2U/
CgotLSAKLSBDaGFybGllCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
