Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D5DCFEEF29
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Apr 2026 12:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lVMo679ReB9YGUWwhlD+5AnHrIEaaOTSIudkNoIKsbA=; b=XkTA/QNbA/AdBj
	3HGB3gVzoleVngjD9gQbGR4+/LjmnoTzA6Wf+EjSX5bRcLRSdFatXgFJ4CWVF9zat36iKX8FWwXsz
	MeKDOq/ZlSUHJn1dTeruDlRv+rfz1FO8HPuowLh6fHjCTougYGh9puHDtA74DVP5dO98M9qrZtXsB
	BXZQ74f/3T7x20dT/+WF6epeSDRLmZ8ngUFAhjAuqPPfU0W4aEKrQat/eMgjLucRzVYG3Ku8/unkJ
	8E3LXjPWyjVKrbyu+EOq3l1X1z4c7zBnJ1UEj3yxFJB+9iyTS/Rv/SMdLWIh6xM1dHwkJeR8rNnSA
	vxF+B7PjSUMdiS7Pz/tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA5Wa-00000006RXz-1lBU;
	Tue, 07 Apr 2026 12:27:20 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA5WX-00000006RWs-3Cao
	for linux-riscv@lists.infradead.org;
	Tue, 07 Apr 2026 12:27:18 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-488a14c31eeso23484265e9.0
        for <linux-riscv@lists.infradead.org>; Tue, 07 Apr 2026 05:27:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775564836; cv=none;
        d=google.com; s=arc-20240605;
        b=PoWiS+nwmGPivzRy774oUQAfQi1iUK+NemgKgeKqTO7eMe50v5p6P6daqIsZZ+XPxm
         qZldsG2a+VlZ7FOkXdOoPCqLpsnkbI9oTaEnSnEFUHNRcu76WjphaYyyA2N96pfw+L15
         OC0JFw3D7YDUXnq5+wYgcwjm2gTXPqAPqtz7D/m0BayzEQcI4ymjQ61hPIhpWGkgJE7h
         cPsTRQxtXwJ6ReU2dyTcNXgWL5dqomPw+mhHZM+FPyIIgnmtmE7mv8kHhQpwslpb3Zg3
         jFGhpUU+ZeN1Pbm3NYPBtI52uSIJ5rzhJTILc3F2FsXFDb0if0fFR7AIUEKXWmxG+d8U
         olxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LSTvil2kmiWEkRGEZct6sPScVZhSg0f4IHqEJjj0g6c=;
        fh=iaj3pcxowbYWQ3cH+Y7A+mB0SZ6Lj5Lv1sagjbitk5c=;
        b=FKvAFDFF1/O0UsFHMP600LgF1ltKOAiQpa/b2B6TPXt+KDnhm5KfCF8tTCqF6vanuY
         +y5rLM3NaA8P8lbBF1Q5MYDMtZhD+R6+dI8bisQDHDvGa5y2gq0JZPc1bVv4LBOE13PV
         2M1ioLqrmbcWVvJK9CN0f1Tcu/JtBvrTmtdM7moxrJsgV4azW6pN6QMt7sCk9Nwezewu
         xnb/cDU0Ndzbv7DKDQP8hknFGKO5W9RvoFtsuXAOMZWrdn3/KoxmLFa2fJhL88Y4NqoU
         UWsKKq9DABaBTBdZXChLURw568SVyWcod2sk7y3jF7OdOS2i1tNWEj/3dAtLaPUg7tn1
         2W5g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775564836; x=1776169636; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LSTvil2kmiWEkRGEZct6sPScVZhSg0f4IHqEJjj0g6c=;
        b=jY1WQ1B8R8Hpkj0A8F0s11ZTAbEmPhmm6ugOMfIGtlugcfc/jg2PmIW3FBXcqab7FE
         rYm9ZMOhgsx5jhUtoGbxKZGG7Rf0khR7M0mAUIDch3agwv2zgf5+myZDd4DsqMehjeEo
         K8LRcPNFnyVsn3XupLtW+ssSuQiO9QjOQemT57VmigIX4NY68peBJ5wO0r2Ffebdl7J5
         y01KZrvFhrjX6NyCDGPLHgepFgK7nmNL721b/qgVYn7taTHlS0tChlVnXFJODbSBZoyQ
         dBuwGbwEXYceeaBGFME4K7+7B32YU4Vigo75YrT4mEwI8dsTD4JAmz/6K9vv0+G0ciZ1
         VJMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775564836; x=1776169636;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LSTvil2kmiWEkRGEZct6sPScVZhSg0f4IHqEJjj0g6c=;
        b=cGi9Yp2LVW2tV1aR+/pRePRvweoU1IpcI2dux/ChpHbq7bIm9e8jxGIaPTjecUbn8P
         +TR1jtObowGsAFV9Cofx986UlSRrAD5locUPGrlx/EUIKo0hNObQUuv4wMxiZ7/pwfHN
         pB991V5xQ4l7uoze/dGHiiN9kLFVUJvfopZe56tjViKCI+pbolJyzJqts1wOy5/aY5J3
         zIMFg1P4fRFRlpDgfpLarD/pYH6Y3jrY2LP8czb/2YOeC5oequflbbFgpUgnxcBMi0un
         zDOKfgPFIaoZzSfNRV+pGmRTBmPnipfCj1bABZ6lqRMx7uNk+xH4JQIR6hruOKCnIwtZ
         CyvQ==
X-Forwarded-Encrypted: i=1; AJvYcCVEsrBhpSZ2H+31aSM3DVUyRjgW5TDCZcY7yYD0QZ1IyvmMuSnKi8tT8NptLuboKVoypfe6GGV+cWjR6A==@lists.infradead.org
X-Gm-Message-State: AOJu0YxWNRPz7KjzdsLDJKBMrF36CuoowBxUoWHojXWGjH/OtQdotq34
	B9aW+QcS38RBng/rQuCXoD2e6DaP/kQg5BMDu2vtGv6vxfJXp2qm1eQSY72B2yofvwJail5gICP
	pJObdLDwwhKglm77GUv65shmeN0hjTlyRgyyn
X-Gm-Gg: AeBDievGi1E9GosFLEsEKZQNqwlRmmsOtYcXjYwnhLk36tsHIdw+zrWsmXE6ek5jTJF
	kukvObXHlMDfFEblN9Z4gtwW98vQFUp44dh2j6TJPbw2wJEq3aQg4tdpRc1AMXepTYKEgO1IneO
	C2d42KrVlP4Or5V6X8l2kIcVgeef5UGC5eyFAKBco/ySvweuKg8GClxsQrpo358utTcrM9suRc6
	9o0yT0HfODzFp5cW7Vz2jChqrJURYczg392kGjV091HV4ycwVYc9T7KfNNpf9jVElTX+j+P6tjU
	O0mTxOmwuzM6JWf4jA==
X-Received: by 2002:a05:600c:630a:b0:485:2fe9:336f with SMTP id
 5b1f17b1804b1-488998e3cbemr239282315e9.30.1775564835411; Tue, 07 Apr 2026
 05:27:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260407074534.59179-1-litaliano00.contact@gmail.com> <8c77810f-8198-46b5-9b6b-23095dbfee1a@lanxincomputing.com>
In-Reply-To: <8c77810f-8198-46b5-9b6b-23095dbfee1a@lanxincomputing.com>
From: litaliano00 <litaliano00.contact@gmail.com>
Date: Tue, 7 Apr 2026 14:27:02 +0200
X-Gm-Features: AQROBzD_u_Fqvi1ZU53l-jVk88-IZovgQdwVzxv0KlrrS-f5bd7M7SblVC6JlzY
Message-ID: <CAK-CEVMvOCTPk=HM=XV8RTXMv3as-nn-YbS6hD_RpFLKME4qmQ@mail.gmail.com>
Subject: Re: [PATCH] riscv: Add WFI to secondary hart spinwait loop
To: BillXiang <xiangwencheng@lanxincomputing.com>
Cc: alex@ghiti.fr, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_052717_836025_2DF8EB3B 
X-CRM114-Status: GOOD (  30.05  )
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

SGkgQmlsbCwKClRoYW5rIHlvdSBmb3IgcmV2aWV3aW5nIHRoZSBwYXRjaC4gWW91IGFyZSBjb21w
bGV0ZWx5IHJpZ2h0IG9uIGJvdGggcG9pbnRzLgoKTmFtIENhbyBwb2ludGVkIG91dCB0aGUgbWlz
c2luZyB3YWtlLXVwIGludGVycnVwdCBlYXJsaWVyIGluIHRoZSB0aHJlYWQsCmFuZCBJIHJlYWxp
emVkIHRoYXQgYSBiYXJlIFdGSSBoZXJlIHdvdWxkIGNhdXNlIGEgZGVhZGxvY2ssIGV4YWN0bHkg
YXMKeW91IGRlc2NyaWJlZCBmb3IgSFNNLWNhcGFibGUgcGxhdGZvcm1zIChvciBhbnkgc2V0dXAg
bGFja2luZyBhbiBleHBsaWNpdApJUEkgYWZ0ZXIgdGhlIHBvaW50ZXJzIGFyZSB3cml0dGVuKS4K
ClRoYW5rIHlvdSBhbHNvIGZvciBjbGFyaWZ5aW5nIHRoZSBpbnRlbnQgb2YgYC5Mc2Vjb25kYXJ5
X3BhcmtgLiBJdCBtYWtlcwpzZW5zZSB0aGF0IGFuIGluZmluaXRlIHNsZWVwIGlzIGFjY2VwdGFi
bGUgdGhlcmUgYnV0IGZhdGFsIGhlcmUgaW4gdGhlCmJvb3QgcGF0aC4KCkkgaGF2ZSBhbHJlYWR5
IHdpdGhkcmF3biB0aGlzIHBhdGNoIGJhc2VkIG9uIHRoZSBlYXJsaWVyIGRpc2N1c3Npb24gd2l0
aApOYW0uIEZpeGluZyB0aGlzIEZJWE1FIHByb3Blcmx5IHdvdWxkIHJlcXVpcmUgYSBsYXJnZXIg
cmVkZXNpZ24gdG8gZW5zdXJlCmEgd2FrZS11cCBzaWduYWwgaXMgZ3VhcmFudGVlZCBhY3Jvc3Mg
YWxsIGJvb3QgbWV0aG9kcywgcmF0aGVyIHRoYW4ganVzdAphIHNpbmdsZS1pbnN0cnVjdGlvbiBj
aGFuZ2UuCgpCZXN0IHJlZ2FyZHMsCkFkcmlhbm8KCgpPbiBUdWUsIEFwciA3LCAyMDI2IGF0IDE6
NTfigK9QTSBCaWxsWGlhbmcKPHhpYW5nd2VuY2hlbmdAbGFueGluY29tcHV0aW5nLmNvbT4gd3Jv
dGU6Cj4KPiBIaSwKPgo+IE9uIDQvNy8yMDI2IDM6NDUgUE0sIEFkcmlhbm8gVmVybyB3cm90ZToK
PiAgPiBUaGUgLkx3YWl0X2Zvcl9jcHVfdXAgbG9vcCBpbiB0aGUgUklTQ1ZfQk9PVF9TUElOV0FJ
VCBwYXRoIGJ1c3ktcG9sbHMKPiAgPiBfX2NwdV9zcGlud2FpdF9zdGFja19wb2ludGVyIGFuZCBf
X2NwdV9zcGlud2FpdF90YXNrX3BvaW50ZXIsIGJ1cm5pbmcKPiAgPiBwb3dlciBvbiBhbGwgbm9u
LWJvb3QgaGFydHMgd2hpbGUgdGhleSB3YWl0IGZvciB0aGUgcHJpbWFyeSBoYXJ0IHRvCj4gID4g
Y29tcGxldGUgZWFybHkgYm9vdCBzZXR1cC4KPiAgPgo+ICA+IEFkZCBhIFdGSSBpbnN0cnVjdGlv
biBiZWZvcmUgZWFjaCBwb2xsaW5nIGl0ZXJhdGlvbiB0byBhbGxvdyB0aGUKPiAgPiBoYXJkd2Fy
ZSB0byBlbnRlciBhIGxvdy1wb3dlciBzdGF0ZSB3aGlsZSB3YWl0aW5nLiBQZXIgdGhlIFJJU0Mt
Vgo+ICA+IHByaXZpbGVnZWQgc3BlY2lmaWNhdGlvbiwgV0ZJIHdha2VzIG9uIGFueSBwZW5kaW5n
IGludGVycnVwdCBldmVuCj4gID4gd2l0aCBnbG9iYWwgaW50ZXJydXB0cyBkaXNhYmxlZCAoU0lF
PTApLCBhbmQgaW1wbGVtZW50YXRpb25zIGFyZQo+ICA+IHBlcm1pdHRlZCB0byB0cmVhdCBpdCBh
cyBhIE5PUCwgc28gdGhpcyBpcyBzYWZlIGluIGFsbCBjb250ZXh0cy4KPiAgPgo+ICA+IFRoZSBz
YW1lIHBhdHRlcm4gaXMgYWxyZWFkeSB1c2VkIGluIC5Mc2Vjb25kYXJ5X3BhcmsgaW4gdGhlIHNh
bWUKPiAgPiBmaWxlLgo+Cj4gVGhlIHNlY29uZGFyeV9wYXJrIGlzIGp1c3QgYW4gaW5maW5pdGUg
bG9vcCBmb3IgZGVidWcgYW5kIGl0IG1heSBub3QgYmUKPiBhIGdvb2QgZXhhbXBsZSB0byBmb2xs
b3cgaGVyZS4KPgo+ICA+Cj4gID4gU2lnbmVkLW9mZi1ieTogQWRyaWFubyBWZXJvIDxsaXRhbGlh
bm8wMC5jb250YWN0QGdtYWlsLmNvbT4KPiAgPiAtLS0KPiAgPiAgIGFyY2gvcmlzY3Yva2VybmVs
L2hlYWQuUyB8IDkgKysrKysrKystCj4gID4gICAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25z
KCspLCAxIGRlbGV0aW9uKC0pCj4gID4KPiAgPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJu
ZWwvaGVhZC5TIGIvYXJjaC9yaXNjdi9rZXJuZWwvaGVhZC5TCj4gID4gaW5kZXggOWM5OWM1YWQ2
Li5jYTIwOGRhN2MgMTAwNjQ0Cj4gID4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvaGVhZC5TCj4g
ID4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvaGVhZC5TCj4gID4gQEAgLTM4NSw3ICszODUsMTQg
QEAgU1lNX0NPREVfU1RBUlQoX3N0YXJ0X2tlcm5lbCkKPiAgPiAgICAgICAqIGdldCBmYXIgZW5v
dWdoIGFsb25nIHRoZSBib290IHByb2Nlc3MgdGhhdCBpdCBzaG91bGQgY29udGludWUuCj4gID4g
ICAgICAgKi8KPiAgPiAgIC5Md2FpdF9mb3JfY3B1X3VwOgo+ICA+IC0gICAgLyogRklYTUU6IFdl
IHNob3VsZCBXRkkgdG8gc2F2ZSBzb21lIGVuZXJneSBoZXJlLiAqLwo+ICA+ICsgICAgLyoKPiAg
PiArICAgICAqIFdhaXQgZm9yIHRoZSBib290IGhhcnQgdG8gcG9wdWxhdGUgdGhlIHN0YWNrIGFu
ZCB0YXNrIHBvaW50ZXJzLgo+ICA+ICsgICAgICogVXNlIFdGSSB0byBhdm9pZCBidXJuaW5nIHBv
d2VyIGluIGEgYnVzeS13YWl0IGxvb3AuIFBlciB0aGUKPiAgPiArICAgICAqIFJJU0MtViBwcml2
aWxlZ2VkIHNwZWMsIFdGSSB3YWtlcyBvbiBhIHBlbmRpbmcgaW50ZXJydXB0IGV2ZW4KPiAgPiAr
ICAgICAqIHdpdGggZ2xvYmFsIGludGVycnVwdHMgZGlzYWJsZWQgKGUuZy4gU0lFPTApLCBhbmQg
aW1wbGVtZW50YXRpb25zCj4gID4gKyAgICAgKiBhcmUgcGVybWl0dGVkIHRvIHRyZWF0IGl0IGFz
IGEgTk9QLCBzbyB0aGlzIGlzIGFsd2F5cyBzYWZlLgo+ICA+ICsgICAgICovCj4gID4gKyAgICB3
ZmkKPgo+IEkgdGhpbmsgdGhpcyB3aWxsIHdvcmsgZm9yIGltcGxlbWVudGF0aW9ucyB0aGF0IHJl
bHkgb24gSVBJIHRvIGJyaW5nIHVwCj4gc2Vjb25kYXJ5IEhBUlRzLCBzaW5jZSB0aGUgSVBJIHdp
bGwgYnJlYWsgdGhlIFdGSS4gSG93ZXZlciwgZm9yCj4gSFNNLWNhcGFibGUgcGxhdGZvcm1zIHRo
YXQgc3RhcnQgc2Vjb25kYXJ5IEhBUlRzIHdpdGhvdXQgSVBJLCB0aGVyZSBtYXkKPiBiZSBubyBw
ZW5kaW5nIGludGVycnVwdCB0byB3YWtlIHRoZSBXRkkuCj4KPiAgPiAgICAgIFJFR19MIHNwLCAo
YTEpCj4gID4gICAgICBSRUdfTCB0cCwgKGEyKQo+ICA+ICAgICAgYmVxeiBzcCwgLkx3YWl0X2Zv
cl9jcHVfdXAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
