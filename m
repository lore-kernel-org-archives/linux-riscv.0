Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25C7AC4167B
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Nov 2023 08:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+Ec68hBhNQyyr5TCOee9LXWmBNlvArg9uKb56oEwMwk=; b=MGKRFI+CtCizSc
	QOzalICmTMc0qHY4rvzR1R+BG5kybaAtISEoZCW1VAxajVTxfX3ouQMyBZi37HxDhwtjXfN6K/n3G
	Wy5Nt+rRGCYCLTbZHRENU0L/C5xgyuUE2sYEXXRXYMwDEqfPjMs0SiVMRxTSMVBcsGsskoBIAZkQw
	zunMS6VA6p2WzeppFZ2Veox8xY2O0+xGm8Bi1gE6l5/OFAvPObTgw3l19bPuPViFo00IPo8YLbxzt
	IXDEilGTXRF00qv7uOJPY2zcfaQK5fG/SfEQw34+sSE/2+kUNujVjZ5P7JRwD0ROVZjfL4h9ia6iQ
	A+qLr0NGbVqSCiyUkBZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7Wl4-001nwX-34;
	Mon, 27 Nov 2023 08:14:22 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7Wl2-001nvk-1I
	for linux-riscv@lists.infradead.org;
	Mon, 27 Nov 2023 08:14:22 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-6cbda959062so3281964b3a.1
        for <linux-riscv@lists.infradead.org>; Mon, 27 Nov 2023 00:14:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1701072855; x=1701677655; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PdH2jyu800OfUGXIQJ9d4watjXtBqJ+y351M+NsN6Fw=;
        b=FARS0birUUaAlUp4meQyEO5/IwyUTVGQwh94Di+0RPT70A+Z5c7saV7mSstBUeEtZs
         uHimFpkhly7XD7M6duoHiAv+IsTqo8lbyQQWR1tXbE+Xdz1ym/XyjfHzGc7amFMM3UEh
         rsV3DMTZLUcaXXLM5VPQtMq9q1q2ekPkrnfaH1n7enHpjaR8Lqis431yHy0TwBCwM1YN
         Cz1dmu/IxLuck0HZkTwF2g5rg8q2tgPOhQWUTM1BC8H8HVHamjqBrwwxTs4UIifTcy+N
         IPaVU8kSSRt4qcnkoPwn5TDHIff0jLxteoNHCVMh2BqJa28BypWwnFJZQSpXRYQVMYWy
         Ftxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701072855; x=1701677655;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PdH2jyu800OfUGXIQJ9d4watjXtBqJ+y351M+NsN6Fw=;
        b=IeIXAW4ZgAkUPaEu4W8LeXCx9xspc8pn1RztAaVkAviz7zkMk50qOCqQAPUATErmJ4
         WhpwsPydB4ASrZBBPTAUN8NbdgHhGogggZEOm0+V0vL+/USvkvWiQZlEoI+bur7wP8GQ
         uusN/lxwIVHMfeKyx865muGU0g5Rj7D7myUfrtxsYBgusGQzvESNsq3c0WVJAac5ypUy
         wZFNkBlFJybwEwJblbpBO/Csc7OkZmecySzKvuFa9BupPaWYSUom01b4RFAvXf8+yV2M
         2RJrzMLEYAXFvNaelFaSq+Cufoz2+z4IZLtBU+jN1jLifc5lrd2sIghNApzulEap5P0k
         wKNA==
X-Gm-Message-State: AOJu0YzyVztKpRZVZkFfns4Jc0MYR9NuEbtb5lEqoH1Ym1lyG64r/U/U
	QCWfQiG+AbbBS6UW7fXFw3KBfn5skYt1HVH7tC0YOg==
X-Google-Smtp-Source: AGHT+IHkgubfh/fHMuR2jP4q4vvT0yJIadwEZTafa6tTobyBu+zFukrQFhvDnBXklybJ5CrJ20pPAiuRPPmKkuEgtJI=
X-Received: by 2002:a05:6a20:9e4d:b0:14c:c511:387d with SMTP id
 mt13-20020a056a209e4d00b0014cc511387dmr11710221pzb.9.1701072855207; Mon, 27
 Nov 2023 00:14:15 -0800 (PST)
MIME-Version: 1.0
References: <20231123065708.91345-1-luxu.kernel@bytedance.com> <94c2e04c-4c62-4ee1-8ae7-cbd675c5064e@app.fastmail.com>
In-Reply-To: <94c2e04c-4c62-4ee1-8ae7-cbd675c5064e@app.fastmail.com>
From: Xu Lu <luxu.kernel@bytedance.com>
Date: Mon, 27 Nov 2023 16:14:03 +0800
Message-ID: <CAPYmKFtA7XuDR3vzd1aw_RC1YY3hDgo-aw-DHw368mdDUtyW6A@mail.gmail.com>
Subject: Re: [External] Re: [RFC PATCH V1 00/11] riscv: Introduce 64K base page
To: Arnd Bergmann <arnd@arndb.de>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Ard Biesheuvel <ardb@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	dengliang.1214@bytedance.com, Xie Yongji <xieyongji@bytedance.com>, 
	lihangjing@bytedance.com, Muchun Song <songmuchun@bytedance.com>, 
	punit.agrawal@bytedance.com, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_001420_441917_6BA472F4 
X-CRM114-Status: GOOD (  27.68  )
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

VGhhbmtzIGEgbG90IGZvciB5b3VyIHJlcGx5ISBBbmQgc29ycnkgZm9yIHJlcGx5aW5nIHNvIGxh
dGUuCgpPbiBUaHUsIE5vdiAyMywgMjAyMyBhdCA1OjMw4oCvUE0gQXJuZCBCZXJnbWFubiA8YXJu
ZEBhcm5kYi5kZT4gd3JvdGU6Cj4KPiBPbiBUaHUsIE5vdiAyMywgMjAyMywgYXQgMDc6NTYsIFh1
IEx1IHdyb3RlOgo+ID4gU29tZSBleGlzdGluZyBhcmNoaXRlY3R1cmVzIGxpa2UgQVJNIHN1cHBv
cnRzIGJhc2UgcGFnZSBsYXJnZXIgdGhhbiA0Swo+ID4gYXMgdGhlaXIgTU1VIHN1cHBvcnRzIG1v
cmUgcGFnZSBzaXplcy4gVGh1cywgYmVzaWRlcyBodWdldGxiIHBhZ2UgYW5kCj4gPiB0cmFuc3Bh
cmVudCBodWdlIHBhZ2UsIHRoZXJlIGlzIGFub3RoZXIgd2F5IGZvciB0aGVzZSBhcmNoaXRlY3R1
cmVzIHRvCj4gPiBlbmpveSB0aGUgYmVuZWZpdHMgb2YgZmV3ZXIgVExCIG1pc3NlcyB3aXRob3V0
IHdvcnJ5aW5nIGFib3V0IGNvc3Qgb2YKPiA+IHNwbGl0dGluZyBhbmQgbWVyZ2luZyBodWdlIHBh
Z2VzLiBIb3dldmVyLCBvbiBhcmNoaXRlY3R1cmVzIHdpdGggb25seQo+ID4gNEsgTU1VLCBsYXJn
ZXIgYmFzZSBwYWdlIGlzIHVuYXZhaWxhYmxlIG5vdy4KPiA+Cj4gPiBUaGlzIHBhdGNoIHNlcmll
cyBhdHRlbXB0cyB0byBicmVhayB0aHJvdWdoIHRoZSBsaW1pdGF0aW9uIG9mIE1NVSBhbmQKPiA+
IHN1cHBvcnRzIGxhcmdlciBiYXNlIHBhZ2Ugb24gUklTQy1WLCB3aGljaCBvbmx5IHN1cHBvcnRz
IDRLIHBhZ2Ugc2l6ZQo+ID4gbm93Lgo+ID4KPiA+IFRoZSBrZXkgaWRlYSB0byBpbXBsZW1lbnQg
bGFyZ2VyIGJhc2UgcGFnZSBiYXNlZCBvbiA0SyBNTVUgaXMgdG8KPiA+IGRlY291cGxlIHRoZSBN
TVUgcGFnZSBmcm9tIHRoZSBiYXNlIHBhZ2UgaW4gdmlldyBvZiBrZXJuZWwgbW0sIHdoaWNoIHdl
Cj4gPiBkZW5vdGUgYXMgc29mdHdhcmUgcGFnZS4gSW4gY29udHJhcnkgdG8gc29mdHdhcmUgcGFn
ZSwgd2UgZGVub3RlIHRoZSBNTVUKPiA+IHBhZ2UgYXMgaGFyZHdhcmUgcGFnZS4gQmVsb3cgaXMg
dGhlIGRpZmZlcmVuY2UgYmV0d2VlbiB0aGVzZSB0d28ga2luZHMKPiA+IG9mIHBhZ2VzLgo+Cj4g
V2UgaGF2ZSBwbGF5ZWQgd2l0aCB0aGlzIG9uIGFybTMyLCBidXQgdGhlIGNvbmNsdXNpb24gaXMg
dGhhdCBpdCdzCj4gYWxtb3N0IG5ldmVyIHdvcnRoIHRoZSBtZW1vcnkgb3ZlcmhlYWQsIGFzIG1v
c3Qgd29ya2xvYWRzIGVuZCB1cAo+IHVzaW5nIHNldmVyYWwgdGltZXMgdGhlIGFtb3VudCBvZiBw
aHlzaWNhbCBSQU0gYWZ0ZXIgZWFjaCBzbWFsbAo+IGZpbGUgaW4gdGhlIHBhZ2UgY2FjaGUgYW5k
IGFueSBzcGFyc2UgcG9wdWxhdGVkIGFub255bW91cyBtZW1vcnkKPiBhcmVhIGV4cGxvZGVzIHRv
IHVwIHRvIDE2IHRpbWVzIHRoZSBzaXplLgo+Cj4gT24gcHBjNjQsIHVzaW5nIDY0S0IgcGFnZXMg
d2FzIHdheSB0byBnZXQgYXJvdW5kIGxpbWl0YXRpb25zIGluCj4gdGhlaXIgaGFzaGVkIE1NVSBk
ZXNpZ24sIHdoaWNoIGhhZCBhIG11Y2ggYmlnZ2VyIHBlcmZvcm1hbmNlIGltcGFjdAo+IGJlY2F1
c2UgYW55IHBhZ2UgdGFibGUgYWNjZXNzIGVuZHMgdXAgYmVpbmcgYSBjYWNoZSBtaXNzLiBPbiBh
cm02NCwKPiB0aGVyZSBhcmUgc29tZSBDUFVzIGxpa2UgdGhlIEZ1aml0c3UgQTY0RlggdGhhdCBh
cmUgcmVhbGx5IGJhZCBhdAo+IDRLQiBwYWdlcyBhbmQgZG9uJ3Qgc3VwcG9ydCAxNktCIHBhZ2Vz
LCBzbyB0aGlzIGlzIHRoZSBvbmx5IHJlYWwKPiBvcHRpb24uCj4KPiBZb3Ugd2lsbCBzZWUgYSBu
b3RhYmxlIHBlcmZvcm1hbmNlIGJlbmVmaXQgaW4gc3ludGhldGljIGJlbmNobWFya3MKPiBsaWtl
IHNwZWNjcHUgd2l0aCA2NEtCIHBhZ2VzLCBvciBvbiBzcGVjaWZpYyBjb21wdXRhdGlvbmFsCj4g
d29ya2xvYWRzIHRoYXQgaGF2ZSBsYXJnZSBkZW5zZWx5IHBhY2tlZCBtZW1vcnkgY2h1bmtzLCBi
dXQgZm9yCj4gcmVhbCB3b3JrbG9hZHMsIHRoZSB1c3VhbCBhbnN3ZXIgaXMgdG8ganVzdCB1c2Ug
dHJhbnNwYXJlbnQKPiBodWdlcGFnZXMgZm9yIGxhcmdlciBtYXBwaW5ncyBhbmQgYSBwYWdlIHNp
emUgb2Ygbm8gbW9yZSB0aGFuCj4gMTZLQiBmb3IgdGhlIHBhZ2UgY2FjaGUuCgpBY3R1YWxseSB3
ZSBkaWQgZmluZCBhY3R1YWwgcGVyZm9ybWFuY2UgYmVuZWZpdHMgYnJvdWdodCBieSA2NEsgcGFn
ZQpzaXplIGluIHJlYWwgYnVzaW5lc3Mgc2NlbmFyaW9zLgpPbiB0aGUgQW1wZXJlIEFSTSBzZXJ2
ZXIsIHdoZW4gYXBwbHlpbmcgNjRLIGJhc2UgcGFnZSBzaXplLCB3ZSBzYXcgYW4KaW1wcm92ZW1l
bnQgb2YgMi41eCBmb3IgYm90aCBxcHMgYW5kIGxhdGVuY3kgb24gcmVkaXMsIGEgcGVyZm9ybWFu
Y2UKaW1wcm92ZW1lbnQgb2YgMTB+MjAlIG9uIG91ciBvd24gbmV3c3FsIGRhdGFiYXNlIGFuZCA1
MCUgb24gb2JqZWN0CnN0b3JhZ2UuCkZvciBteXNxbCwgdGhlIHFwcyBpbmNyZWFzZXMgYWJvdXQg
MTQlLCAxNy41JSBhbmQgMjAlIGZvciByZWFkLW9ubHksCndyaXRlLW9ubHkgYW5kIHJhbmRvbSBy
ZWFkL3dyaXRlIHdvcmtsb2FkcyByZXNwZWN0aXZlbHkuIEFuZCB0aGUKbGF0ZW5jeSByZWR1Y2Vz
IGFib3V0IDEzLjclLCAxNS44JSBhbmQgMTQuNSUgb24gYXZlcmFnZS4KVGhpcyBpcyBhbHNvIHdo
eSB3ZSBjaG9zZSB0byBpbXBsZW1lbnQgYSBzaW1pbGFyIGZlYXR1cmUgb24gUklTQy1WIGluCnRo
ZSBiZWdpbm5pbmcuCgo+Cj4gV2l0aCB0aGUgd29yayBnb2luZyBpbnRvIHVzaW5nIGZvbGlvcyBp
biB0aGUga2VybmVsIChzZWUgZS5nLgo+IGh0dHBzOi8vbHduLm5ldC9BcnRpY2xlcy85MzIzODYv
KSwgZXZlbiB0aGUgd29ya2xvYWRzIHRoYXQKPiBiZW5lZml0IGZyb20gNjRLQiBiYXNlIHBhZ2Vz
IHNob3VsZCBiZSBiZXR0ZXIgb2ZmIHdpdGggNEtCCj4gcGFnZXMgYW5kIGp1c3QgdXNpbmcgdGhl
IFRMQiBoaW50cyBmb3IgbGFyZ2UgZm9saW9zLgoKTWF5YmUgNjRLIHBhZ2Ugc2l6ZSBjb21iaW5l
ZCB3aXRoIGxhcmdlIGZvbGlvcyBjYW4gYWNoaWV2ZSBtb3JlIGJlbmVmaXRzLgpBcyBpcyBtZW50
aW9uZWQgaW4gdGhpcyBwYXRjaFsxXSwgYSA2NEsgcGFnZSBzaXplIGtlcm5lbCBjb21iaW5lZCB3
aXRoCmxhcmdlIGZvbGlvcyBhbmQgVEhQcyB2aWEgY29udCBwdGUgY2FuIGFjaGlldmUgc3BlZWR1
cCBvZiAxMC41eCBvbgpzb21lIG1lbW9yeS1pbnRlbnNpdmUgd29ya2xvYWRzIG9uIGFybTY0IFNC
U0Egc2VydmVyLgoKWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC9jNTA3MzA4ZC1iZGQ0
LTVmOWUtZDRmZi1lOTZlNDUyMGJlODVAbnZpZGlhLmNvbS8KCj4KPiAgICAgIEFybmQKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
