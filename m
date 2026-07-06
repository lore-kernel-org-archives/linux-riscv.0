Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36362C43458
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jul 2026 00:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZaBMIJAZgrkDQTcZH4K/ovUhXPAlyBKvu1x3l5LASIg=; b=p/LnWnidkZZAfw
	PYEl1WXgN/4BvgkuGRrJg2vvRCcO1pmmyDtJr0/5Te66rGSv0vKc7x7KOe8z5PZ/Sxv6DKfDQgOxL
	IczRNL5fACpnELzdc0OEXfi6c+XtD/5p+JPE1jxlHooY8XQ+OhInpmDt6KP0zauY8b5HX7/KggDNb
	qONl5U0EFv3Ut3gUgkD5x3lTIpjon9dD5xq7B5ZVBMiP+LbcpIS6REW4HwcSQJh08D7Bf2nF/VCME
	YjnH4Z/CSMVdkSHgkvh6VGVjhRn70wj/VrX3NTblWt5wNDHKcF3uJM/SvH4kTr1y5zpV/y7BoyU8I
	6MBmf4uYvlx49CRwd2SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgWpF-0000000ApxW-2iBf;
	Mon, 06 Jul 2026 00:04:41 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgWpC-0000000Apwo-38En
	for linux-riscv@lists.infradead.org;
	Mon, 06 Jul 2026 00:04:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783296277;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gDia0DoYIpwPsuYDBJR9TVRq1ZkrfGuScKjEdDaH/ok=;
	b=gk4kq7QhAiuD9jB06rYEYsf7/sj7aOI+fGN/5W9qvIP3uePPQtGfXk7ag6nIpPKg641JTH
	pQbLMbuLBtITdM+txx7zJYZKd1K5TGN2i893tgYLXCg7H8jgv13FmOMtlCXdGOR2BmZzli
	/+sgrBiXopsAnzTCscc0IzznuGT9A9k=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-392-CQus3m3jPZ2SOAC6_Q-BxQ-1; Sun, 05 Jul 2026 20:04:35 -0400
X-MC-Unique: CQus3m3jPZ2SOAC6_Q-BxQ-1
X-Mimecast-MFC-AGG-ID: CQus3m3jPZ2SOAC6_Q-BxQ_1783296275
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c19493ac2so20767041cf.1
        for <linux-riscv@lists.infradead.org>; Sun, 05 Jul 2026 17:04:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783296275; x=1783901075;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gDia0DoYIpwPsuYDBJR9TVRq1ZkrfGuScKjEdDaH/ok=;
        b=EflX+USEvYeJXGtL/qpoZprs78JuKpghOzRi2QC2q0aK/mdy4GJjd8XE/0AAqfZaV/
         l8Ccj+lTUWVADoFivXbmJ6q9gTi4dhJgn4KQpdS4bHmDJxMvltkR4ZfAA1Am+uULdh4P
         y93Z82ekCoN8S3eYIuqDsEweyD7OE5tWBR72JAXI61/RylD804GNUEbwqG+dmAR2Mksd
         7u8tSR+jb8Sed10LQJP+VyLonc3Z43SN71q16LmTS8rrB2Tq+E+C/NLrSOoU6NJCwcEw
         tquW5w+fSybAT+T0ov0kcLgOokvuSgN0fuuZ1ScjC0di2OFngQi5qZ9CG5O3A4018OiO
         WW7A==
X-Forwarded-Encrypted: i=1; AHgh+RoLNDSRP1shRvvSm71ONXG7OEoo6K52zbsfjB/HSdxQltxiD8fcETcTv/z42mYrqfMton1vd2Qsb4YxyA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzs2a65L3bQda2SyDjKZWfmJslbBQZmhhrD0ZP+V0wn/f6zbZsX
	KfcsEZPqTvCdHVYzWfwfEEKF/IRViW+N52K2ASrnhQ1tsdwqcHsAQGkSg8sbMZzJ8YNSh/NLRoU
	EzitAhtC2+iqjSR0DTKZeJkFG4p4QkvdiX7Z9382cYmqOwgBCwEu/35FVv+HODwQKyQrvGhqcCX
	cJJCww7w9T6AbOwq06MtlDCEzm4zXm6PQ5y6fosn1Lxu9b
X-Gm-Gg: AfdE7ck5J7xTkRkeP7+uDz2GCUf2yPfvTGqDyMRfnrp//RWI1noahTnhf4hy1uuK9HH
	HWzBW4Zk7qxQfnm4t8UGdD6wqEETT9FJF0Cej+ZxnycEoMtdSuqNGzBxNcM4v93tu4b9NXwixJe
	F4LXE7UhCH28D67C5S8/JP2iohS1avhYFLUE9uKlKfiFJDN20aE9pB
X-Received: by 2002:a05:622a:16:b0:517:580c:bcd3 with SMTP id d75a77b69052e-51c4c20cba0mr122057081cf.19.1783296273936;
        Sun, 05 Jul 2026 17:04:33 -0700 (PDT)
X-Received: by 2002:a05:622a:16:b0:517:580c:bcd3 with SMTP id
 d75a77b69052e-51c4c20cba0mr122056741cf.19.1783296273461; Sun, 05 Jul 2026
 17:04:33 -0700 (PDT)
MIME-Version: 1.0
References: <20260703111530.91285-2-ltao@redhat.com> <5df82d42-89cd-4e39-95a9-a0f164c0ac58@web.de>
 <2vxzqzlkf7a3.fsf@kernel.org>
In-Reply-To: <2vxzqzlkf7a3.fsf@kernel.org>
From: Tao Liu <ltao@redhat.com>
Date: Mon, 6 Jul 2026 12:03:57 +1200
X-Gm-Features: AVVi8CcjKi4ma2Wic4NJ9zPTMxZKVqVzntIjTUPD2jSDdeylkQQJ6VcTIYGM5zI
Message-ID: <CAO7dBbVmLi8gWcntM9tn2g=GWgAkYQB1P7_-J1Kf8wYrd0Ucww@mail.gmail.com>
Subject: Re: [PATCH v4] riscv: Prevent NULL pointer dereference in machine_kexec_prepare
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Markus Elfring <Markus.Elfring@web.de>, linux-riscv@lists.infradead.org, 
	kexec@lists.infradead.org, linux-integrity@vger.kernel.org, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, kernel-janitors@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>, Baoquan He <bhe@redhat.com>, 
	Dmitry Kasatkin <dmitry.kasatkin@gmail.com>, Eric Snowberg <eric.snowberg@oracle.com>, 
	Jarkko Sakkinen <jarkko@kernel.org>, Mimi Zohar <zohar@linux.ibm.com>, 
	Nutty Liu <nutty.liu@hotmail.com>, Roberto Sassu <roberto.sassu@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 3oW7qGJXMKEePNhdrNyomRcIKaaipFOuhFKQgkQvP1w_1783296275
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_170438_889678_F69D5F39 
X-CRM114-Status: GOOD (  16.74  )
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

SGkgUHJhdHl1c2ggJiBNYXJrdXMsCgpPbiBTYXQsIEp1bCA0LCAyMDI2IGF0IDI6NTnigK9BTSBQ
cmF0eXVzaCBZYWRhdiA8cHJhdHl1c2hAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBGcmksIEp1
bCAwMyAyMDI2LCBNYXJrdXMgRWxmcmluZyB3cm90ZToKPgo+ID4+IEEgTlVMTCBwb2ludGVyIGRl
cmVmZXJlbmNlIGlzc3VlIGlzIG5vdGljZWQgaW4gcmlzY3YncyBtYWNoaW5lX2tleGVjX3ByZXBh
cmUoKSwKPiA+PiB3aGVyZSBpbWFnZS0+c2VnbWVudFtpXS5idWYgbWlnaHQgYmUgTlVMTCBhbmQg
Y29waWVkIHVuY2hlY2tlZC4KPiA+IOKApgo+ID4KPiA+IFdvdWxkIGl0IGJlIGhlbHBmdWwgdG8g
YXBwZW5kIHBhcmVudGhlc2VzIHRvIGEgZnVuY3Rpb24gbmFtZSBhbHNvIGluIHRoZSBzdW1tYXJ5
IHBocmFzZT8KPiA+Cj4gPiBXaHkgd2FzIHN1Y2ggYSBoaW50IG5vdCBiZSB0YWtlbiBpbnRvIGFj
Y291bnQgZnJvbSBhIHByZXZpb3VzIHN1Z2dlc3Rpb24/Cj4KPiBPaCBjb21lIG9uLCB0aGlzIGlz
IGEgcmVhbGx5IHJlYWxseSBtaW5vciBuaXRwaWNrLiBUaGUgZmFjdCB0aGF0Cj4gbWFjaGluZV9r
ZXhlY19wcmVwYXJlIGlzIGEgZnVuY3Rpb24gaXMgZmFpcmx5IG9idmlvdXMgd2hlbiByZWFkaW5n
IHRoZQo+IHBhdGNoLiBJbiBmYWN0LCB0aGUgZmlyc3Qgc2VudGVuY2Ugb2YgdGhlIGNvbW1pdCBt
ZXNzYWdlIHVzZXMgdGhlCj4gcGFyZW50aGVzZXMuCj4KPiBTbyB5ZXMsIGl0IHdvdWxkIGhhdmUg
YmVlbiBuaWNlIHRvIGhhdmUgdGhlbSBpbiB0aGUgc3ViamVjdC4gQnV0IG5vLAo+IHRoaXMgaXMg
bm90IGF0IGFsbCB3b3J0aCBhbnlvbmUncyB0aW1lIHRvIGZpeC4gQ2VydGFpbmx5IG5vdCBhdCBh
bGwKPiB3b3J0aCBhIHY1Lgo+Cj4gUGxlYXNlLCBsZXQncyBub3Qgbml0cGljayBvdXIgY29udHJp
YnV0b3JzIGludG8gZ2l2aW5nIHVwLgo+CgpUaGFua3MgZm9yIHRoZSByZXZpZXcgYW5kIGZvciBw
b2ludGluZyBvdXQgdGhlIGlzc3VlcyBpbiBteSBwYXRjaC4KCkknbSBzdGlsbCBuZXcgdG8ga2Vy
bmVsIHBhdGNoIHN1Ym1pc3Npb24gYW5kIGNsZWFybHkgaGF2ZSBhIGxvdCB0bwpsZWFybi4gSSBh
cHByZWNpYXRlIGFsbCB0aGUgZmVlZGJhY2suIFRoYW5rcyBhZ2FpbiBmb3IgeW91ciBwYXRpZW5j
ZQphbmQgZ3VpZGFuY2UuCgpUaGFua3MsClRhbyBMaXUKCj4gLS0KPiBSZWdhcmRzLAo+IFByYXR5
dXNoIFlhZGF2Cj4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
