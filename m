Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 386D7606A320
	for <linux-riscv@archiver.kernel.org>; Sat, 21 Nov 2026 23:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MRKYVLp+;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SilQ/Wab
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=rASQdddVgeExq0NSynESgWdzjyh2jVp3F6uuIuN0Dks=; b=MRKYVLp+VCW/nPGnsD4vLtui0k
	K2tKsBttQSgZQufSH/g6pJ7f7K4zzwtVXe7P3WhjAJyXJxrAXJm9B1ke+RvVGpr+3VDMeYmKLUgO9
	m3bfWEikGW9iJxD/mM5Ad7TbK08xd4DZBjlSDqdKQGK42EbsA3Zsh8pw33jNfRZgni2SqKB5KbuuT
	HHm30432hFSRTlq8IsVfZvul7JlB5GlPmj+plXObZNUUir05PNdF3BmRH5SnNfzPr2D9DUKZJiSJJ
	WC0Xf1QE1ti8L62gWrGZn0M9lhZyoL5ICXT6y2oIoUr8+R+dg/Z6dcGc8KZO6RhiwzuSieQyPLYnr
	uXHpHHzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUumJ-00000000XHf-0THg;
	Sat, 21 Nov 2026 23:45:55 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUulL-00000000WBi-2k7b
	for linux-riscv@lists.infradead.org;
	Sat, 21 Nov 2026 23:45:03 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-cc758830601so1710203a12.2
        for <linux-riscv@lists.infradead.org>; Sat, 21 Nov 2026 15:44:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795304694; x=1795909494; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=euG+RqQvheU6keSPzs75dZgF0gjjXiXQTzRnhsV5zcw=;
        b=SilQ/Wabdqr/zpuIz0NGp697d94PDXrrljvbVYkCMwAzyK6q2kVf/WQzX95jrQYp0L
         b4ZpeNMEg6yu3GMWrVWi2ZZDUmQHo4FdW69TgTN4B1PIi+9aVWzDTkjWtdFQaLKW5XcG
         NZRPq1PK3+IG8TQeNvj5OZOrF5AQIxvZDtMTgJlU36HV9v+BfJWhFn5tQlJ56qcaS2+D
         DOkI5yrPijODi6IQoqnI+sRDVHWrlJQiyd3Nnu4RGhx/PozlrfGLPTeVCi1lOHe+ZsRK
         equC+0clBTztTWebEId41mN3M1heKfrde7gwlIjUmtGRCET6drWABHpooBDAbNChmDay
         v1+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795304694; x=1795909494;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=euG+RqQvheU6keSPzs75dZgF0gjjXiXQTzRnhsV5zcw=;
        b=aAtXnuv0Ftr9DQcuqFrtKZpgtQr7R6pYkdvzkgQe62hYVDwf4ECOb9e3z+EbczKyZv
         VVwm7HFUmxPbPfHwSUy20V9Gg2G2VrFX2+ocAvjnaP8ul2L3M+OWalMvFlJ2+JAZXHrS
         cSBfNGCgMHz9pvglr5dDYhgfwS2XpdzkQBfjMQZZZ0tgLPpHEieLQK6Uh525fNlMzANh
         SoAxTLqOrtP7thiXNtn92+AdKCtU3TDmFWwe54srDrnsNXK7L6SXd5sIaw7gc3PcQJ5j
         ttbC0tQKlng4wf7pixbMfMNiv6bFiKBhyLP5/zutxrWWM9FbMtXvNBIv1szaHn4M0TIN
         mJyA==
X-Forwarded-Encrypted: i=1; AL+hErFWG7YRxZ/XzOBvdAGSIKLhLlFB1d084TKc1QP7CIDf4pgrK0FkbLDxSB40MEEOhClG7kP8SwAfev0XZw==@lists.infradead.org
X-Gm-Message-State: APuU4Z/B3Tdycf20KxQZ+Qx73fjDNwwyicC5Cek6RpXtBGGcp35p+fsu
	2MYQIR510v2THMkErKy0RHbAbzFhNEfE2pztczlt3gVkL9TXZSfG8tTlCR/OVrfAyqw=
X-Gm-Gg: AZFdTZeNabXaH5m+5EsvyzihT4Uk8LXpZZ4clEjdW4SBg3FX1zaT7dokA37VpzTyWaA
	12MRn0Z2dPTA5OcfYDKk45FDbw2OH1MOoK84zL56pMqJY5axUMrCXn4uSQ0Sf5P612YknLi+W+S
	TvUIg6bEp456GUohTmCiisTxkuhfGTNBMgkDCMDQgKjtC/AeLhFCka4n8cZqzbvr+J6PO5Jr1Ng
	m2cJMMMvbwk40yTL8QPaa3PC0m+Byw7PFuP5dPd8vlZwsfGNWNp445IOgouhvYynrFCs3vNzePT
	oGAx6KTz92dhRR6yRd0D1BDnzO36w5oif7o9m5p/4W2HxK+hHPnJFPWm/OpJ9UQz7p1BtO+1vWb
	IiYYf/RIL+4RelMZBZ1Bkyt66pWgEbtjNKz/nN+mjC/tNGf8p2fEMWBmNRsSCA1BgTF9CurBRyj
	BnJsNiTcxNtN400d2a4cemoBCXyZk+mEQEBqOeaPJ6NpuD+1Z0SGhB40GgRBrHzdvip+msB906F
	hFPr8mth5K/+nfjiha25c/0i4T4/H9uSkWLWejkokDIhL2toYmbk4tvuRA7IeHT6kXQk09lJnJh
	9t5bMI0P77ZtmcIZY8M+BUaCL1Ri4TpEW5dU48BcdHDeyHJV
X-Received: by 2002:a05:6a20:6a08:b0:3f8:f0b1:e7bd with SMTP id adf61e73a8af0-4014d457995mr7749315637.39.1795304694184;
        Sat, 21 Nov 2026 15:44:54 -0800 (PST)
Received: from localhost ([2001:19f0:8000:4ce8:5400:7ff:fe0e:e6b2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87285c219sm3289745b3a.18.2026.11.21.15.44.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 15:44:53 -0800 (PST)
Date: Sun, 22 Nov 2026 07:44:20 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: =?utf-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: AnnanLiu <annan.liu.xdu@outlook.com>, Chen Wang <chen.wang@linux.dev>, 
	Alexander Sverdlin <alexander.sverdlin@gmail.com>, sophgo@lists.linux.dev, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2] riscv: dts: sophgo: add watchdog dt node for CV1800
Message-ID: <awIsvG9xhNFPe1Bj@inochi.infowork>
References: <DM6PR20MB2316366FC9ADCBC7B6E9C289AB7A2@DM6PR20MB2316.namprd20.prod.outlook.com>
 <20261113124748.339778-1-chenyou910331@gmail.com>
 <av2McZf10FiOKDcZ@inochi.infowork>
 <CAKspUhLiZ8GwfVu5cs3f3nr0uFV=qEFs2r+xP+1CkZ5jT5rp6Q@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKspUhLiZ8GwfVu5cs3f3nr0uFV=qEFs2r+xP+1CkZ5jT5rp6Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_154455_745739_F2874D17 
X-CRM114-Status: GOOD (  14.37  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gVGh1LCBOb3YgMTksIDIwMjYgYXQgMDc6NTY6NTZQTSArMDgwMCwg6JGJ5a645L2RIHdyb3Rl
Ogo+IE9uIFdlZCwgTm92IDE4LCAyMDI2IGF0IDA3OjMyOjUwUE0gKzA4MDAsIElub2NoaSBBbWFv
dG8gd3JvdGU6Cj4gPiBJZiB5b3Ugd2FudCB0byB0YWtlIHRoaXMgcGF0Y2gsIHlvdSBuZWVkIHRv
IGFkZCBhbGwgd2F0Y2hkb2cgZGV2aWNlCj4gPiBpbnN0ZWFkIG9mIHRoZSBvbmx5IG9uZSBmb3Ig
UklTQy1WLiBUaGVyZSBhcmUgdGhyZWUgd2F0Y2hkb2cgZGV2aWNlcwo+ID4gZm9yIEE1My9DOTA2
IDAvQzkwNiAxLiBJSVJDIG9ubHkgb25lIGNhbiB0YWtlIGVmZmVjdCBhdCB0aGUgc2FtZQo+ID4g
dGltZS4KPiAKPiBPSywgSSB3aWxsIGFkZCBhbGwgdGhyZWUgKFdEVDAtMikgdG8gdGhlIHNoYXJl
ZCBkdHNpLCBzbyB0aGUgYXJtNjQKPiBTRzIwMDAvU0cyMDAyIERUUyBnZXRzIHRoZW0gdG9vLgo+
IAo+IFNpbmNlIG9ubHkgb25lIGNhbiB0YWtlIGVmZmVjdCwgc2hvdWxkIGFsbCB0aHJlZSBiZSBl
bmFibGVkIGluIHRoZQo+IGR0c2ksIG9yIHNob3VsZCB0aGV5IGJlIGRpc2FibGVkIHRoZXJlIGFu
ZCBlbmFibGVkIGJ5IHRoZSBib2FyZCBEVFM/Cj4gSSB3aWxsIGNoZWNrIGluIHRoZSBUUk0gaG93
IHRoZSBhY3RpdmUgb25lIGlzIHNlbGVjdGVkIGFuZCB0ZXN0IGVhY2gKPiBvZiB0aGVtIG9uIHRo
ZSBEdW8gMjU2TS4KPiAKPiBSZWdhcmRzLAo+IENoZW4tWXUKCkFsbCBzaG91bGQgYmUgZGlzYWJs
ZWQsIG9ubHkgbmVlZGVkIG9uZSBpcyBlbmFibGVkLgoKUmVnYXJkcywKSW5vY2hpCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
