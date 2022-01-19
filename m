Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B53FC433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jan 2022 21:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q0qFY8pVjdzJOtMcjvGG5PyyoGqD1DaOB221jIgg2IE=; b=zwUDDSYkTWUj1h
	9ikG/InJBppyt/yGpc6sw+hB3gAZqi+7fboBGJIE3HE+5AZd2AcrFzo1p2oAsmmkSoxK2c3Ee7mFy
	3mx8qQdOP7vOd7LpTW1gdwo9uF0LsIUKgFZl9ganxt22q53/k+kxWp+YwgHoQsGXDIad2FHkHwWI1
	2bIJycklzqTraMgmsldc8Kob+EE2/h2nrz83Kl/uk8jZBxN/McsUFt7y+LmD6L7vgKIKZqScMdHnf
	3wKRyKIYOM8Qv2I2GFgPTdzKukiXCOtEaKWslE3S/L6jtEEWe8Q40ugoQ8PBqsj1QgbV4m2gbV9fS
	gldGShSLRuj+aJbHFrjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAIUi-007Vbt-1m; Wed, 19 Jan 2022 21:27:52 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAIUf-007VbK-7K
 for linux-riscv@lists.infradead.org; Wed, 19 Jan 2022 21:27:50 +0000
Received: by mail-wm1-x333.google.com with SMTP id
 az27-20020a05600c601b00b0034d2956eb04so8442795wmb.5
 for <linux-riscv@lists.infradead.org>; Wed, 19 Jan 2022 13:27:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jrtc27.com; s=gmail.jrtc27.user;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=avo5ZU/4d3ledcXQGjLRI4MWmFV84MWjZbdkjnrRnoY=;
 b=e/QtK09h7oRwdH2JjLU21Bb2qbBJ6UJx3ErH1DsCnFgFzwxUijwed1xnKX6P3A7pWR
 KiutQTn1w86uZ44H+uKBCoLUAKe5MBKumfnbNjWLOJHsHizoHzgGHaAV6P5tmuZZzxxX
 zDNs9eRHOJP699gDDVWOB83seqg1Ou4Cao2CkcHaHWfv/z9J45H9GeTW6RGOiDs+pFvY
 mo/wLCMUqmA/8iL8OZ8IC7QbvpjllhFkfS9hVoMjVQ3OR2oRU3y6ydyBZDhRJR04j6kM
 +8a3EorNwrGWVc93lY0X89VPw+uAqEHCeTPNfiJbPO4OgDOx2DUpRz0A6/Tolhv5eP+J
 tS1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=avo5ZU/4d3ledcXQGjLRI4MWmFV84MWjZbdkjnrRnoY=;
 b=RH77BDMp6BDlmpKYhOkIR6sArk59WM0atTQMvYHybf6CFZtaaXbekggKE3BhR41EG1
 dCL34X+tWHTk/dMWBNkEebKq9j61bAUnySkGhPQPNFHgiU86FRwFsx2SWw4Y7B3hWVta
 1jZ2KUVUeBQaDTnxJz5w/QdUUcHY5VII5iNmVRqHCJvNMdGGHL4znrKwZgIKCxTPrcEa
 8OM1hENJuzjDdSg9HSn0LJGEcoXlCSolh7hcEdHN/dbMsareUpBPDbMjT8LMIaZCFsw4
 3vctIw6Nw96ofZfw/tVBg+huHwcwpwAmjDQJx7zjJ/U8ktVgl2W7LitMEojeHSNV/Lq7
 IJcQ==
X-Gm-Message-State: AOAM531pmgA62eRGPYDy4Io8ow2t86Qe99IAfJv8TA7OVoUbs+PPTNyE
 6R5vsrFcwiEBR8XKEW2Vpne1mQ==
X-Google-Smtp-Source: ABdhPJzworTR5h9GQNQh8lAHDMdibHymP81fW0QJeouN9jiuWORxb8k869VAtIbqoAvE0RArFAltQw==
X-Received: by 2002:adf:9dc5:: with SMTP id q5mr6205175wre.272.1642627667694; 
 Wed, 19 Jan 2022 13:27:47 -0800 (PST)
Received: from smtpclient.apple (global-5-142.nat-2.net.cam.ac.uk.
 [131.111.5.142])
 by smtp.gmail.com with ESMTPSA id e16sm836300wrt.61.2022.01.19.13.27.47
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 19 Jan 2022 13:27:47 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.40.0.1.81\))
Subject: Re: [PATCH] riscv: eliminate unreliable __builtin_frame_address(1)
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <87y23b5t9g.fsf@igel.home>
Date: Wed, 19 Jan 2022 21:27:46 +0000
Cc: Changbin Du <changbin.du@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv <linux-riscv@lists.infradead.org>, linux-kernel@vger.kernel.org
Message-Id: <BD64D67C-613B-495E-9FB7-2AFB6FA15308@jrtc27.com>
References: <20220117154433.3124-1-changbin.du@gmail.com>
 <C2470F2D-9E45-49D7-A03B-E6A7BB4B9738@jrtc27.com> <87v8yg6lhf.fsf@igel.home>
 <AAAA7852-EBCA-47A3-B74E-A425023468C6@jrtc27.com> <8735lj78wu.fsf@igel.home>
 <8F8D535F-3637-4BC7-8853-B709EC5D14C9@jrtc27.com> <87y23b5t9g.fsf@igel.home>
To: Andreas Schwab <schwab@linux-m68k.org>
X-Mailer: Apple Mail (2.3693.40.0.1.81)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220119_132749_292664_741EA794 
X-CRM114-Status: GOOD (  13.15  )
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

T24gMTkgSmFuIDIwMjIsIGF0IDIxOjA3LCBBbmRyZWFzIFNjaHdhYiA8c2Nod2FiQGxpbnV4LW02
OGsub3JnPiB3cm90ZToKPiAKPiBPbiBKYW4gMTkgMjAyMiwgSmVzc2ljYSBDbGFya2Ugd3JvdGU6
Cj4gCj4+IE15IHBvaW50IGlzIHRoYXQgdGhlIG9ubHkgdGhpbmcgdGhhdCBjYW4gcG9zc2libHkg
cmVhZCB0aGUgaW5jb21pbmcKPj4gZnJhbWUgcG9pbnRlciBvZiBhIGxlYWYgZnVuY3Rpb24gaXMg
dGhlIGxlYWYgZnVuY3Rpb24gaXRzZWxmLCBhbmQgc2luY2UKPj4gaXQga25vd3Mgd2hlcmUgaXTi
gJlzIHB1dHRpbmcgaXQgdGhlbiB0aGVyZSBpcyBubyBBQkkgaXNzdWUsIGl0IGp1c3QKPj4gcmVt
ZW1iZXJzIHdoZXJlIGl0IHB1dCBpdCBhbmQgbG9hZHMgaXQgZnJvbSB0aGVyZS4KPiAKPiBsbHZt
IHNpZGVzdGVwcyB0aGF0IGlzc3VlIGJ5IGFsd2F5cyBzYXZpbmcgcmEgd2hlbiBjcmVhdGluZyBh
IGZyYW1lLAo+IGV2ZW4gaW4gYSBsZWFmIGZ1bmN0aW9uLCBzbyBpdCBjYW4gdXNlIGEgY29uc3Rh
bnQgb2Zmc2V0LgoKV2hhdOKAmXMgeW91ciBwb2ludD8gVGhhdOKAmXMgYSBjb3JyZWN0IGltcGxl
bWVudGF0aW9uLCBqdXN0IGEgc2ltcGxlIG9uZS4KSWYgaXQgd2FudGVkIHRvIFJJU0NWRnJhbWVM
b3dlcmluZzo6c3BpbGxDYWxsZWVTYXZlZFJlZ2lzdGVycyBjb3VsZAplYXNpbHkgc2F2ZSB0aGF0
IGluZm9ybWF0aW9uLCBvciByZWNvbXB1dGUgaXQgd2hlbiB0cnlpbmcgdG8gbG9hZCBzMCwKaXQg
anVzdCBkb2VzbuKAmXQgYmVjYXVzZSB0aGVyZeKAmXMgbm8gbmVlZC4gQWxzbyBzYXZpbmcgczAg
YWxvbmdzaWRlIHJhIGlzCmRlbGliZXJhdGUsIGl0IGFpZHMgZGVidWdnaW5nIHdoZW4gY2FsbGlu
ZyBub3JldHVybiBmdW5jdGlvbnMgKGUuZy4KcGFuaWMgaW4gYW4gT1Mga2VybmVsKS4gU28geWVz
LCB3ZSBhdm9pZCBjb21wbGV4aXR5IGluIExMVk0gYnkgbm90CmRvaW5nIHRoaW5ncyB3ZSBkb27i
gJl0IG5lZWQgdG87IHRoZXJl4oCZcyBub3RoaW5nIHdyb25nIHdpdGggdGhhdCBhbmQgaXQKZG9l
c27igJl0IG1lYW4gb3RoZXIgdG9vbGNoYWlucyB0aGF0IGRvIG5lZWQgdGhhdCB0byBiZSBjb3Jy
ZWN0IHNob3VsZApqdXN0IGRvIHNvbWV0aGluZyB3cm9uZy4KCkplc3MKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
