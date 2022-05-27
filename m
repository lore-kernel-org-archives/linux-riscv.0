Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43F37C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 27 May 2022 13:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rLROvthhU3cGny62JAWAZmf0y8bejWCairDSXdp8X0Q=; b=LZfcX+8p1DAg3T
	VQj24SefDHT2jOJh3mpx+W0X1gOea8nN0Z9AFdcMVhufA+jIuy2AiBOEArC8CTHl8bP7xoLLaj28D
	YcEvDCDU7z/u22YGj0pVZisdGHRIU+cNVRkzpwvCjWasdc8kbvm1BQTGK/dIxiR6qjDPcte9/SKZP
	YB9v4NuCwY2cLESZTGSoE5ay1pUpgycsfaWhZPRf//BviM4354uPGp/ACD903b2yAkZGCdJMUps5+
	57XrxQfzEGmFNT+mh8KqNpauPHCb336rxjxfBZcOM1C+dxKf3qXM1FEHN9CpvIxHcHDuRFVAl5ssX
	CQGcoJaV9okk6MsR6fCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuZbS-0005Y4-NB; Fri, 27 May 2022 13:02:06 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuZbP-0005XI-AV
	for linux-riscv@lists.infradead.org; Fri, 27 May 2022 13:02:05 +0000
Received: by mail-lf1-x130.google.com with SMTP id p22so6726298lfo.10
        for <linux-riscv@lists.infradead.org>; Fri, 27 May 2022 06:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=y9dRzSEE6qIZVHgcjwE6BybELU2ejo/ROH1wde8bWlw=;
        b=WOw2OdJ8j2sliEnbDhaeP5MFvVJkvTBecIJZTae5CUAVwMd2FfoH7MKBEBWkmvGFqA
         yhYMM7C3uuOCtNV+NyhKmgRvYwLwOkMqe7JeiBIZTZ6cjCEUYF4cpvXj1nWAjzMmkdAM
         o5BzE98QC7u9v7B+TIrwoa+zbdacZfQhJ6X7FFgUUImxjjFxz6Y+LP7MpV8hQ7bFclvz
         cX6aUPtreI07BUIATuwFNtH9VAC8kuKT9pkeuuGGlRAHXOol4t+STwowma5wSCE4OPvl
         5R4pPZUx1FddliKY5DBuTUe+MAhgjxOsBIfhv4QtXlBe7z/gKOGst5KfXyYOs5T42MbB
         EzSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=y9dRzSEE6qIZVHgcjwE6BybELU2ejo/ROH1wde8bWlw=;
        b=kqHWwLypdKAhdQhCpvE03ySXFlx+hSgglDcIYdy3VqhK685OgaPRDatcPFSeGKXXMY
         kxmVY5H/6CrYyj4fkPnhgItiNhNstD6QjFdtERvshLftupCX4cbHhVZ/a4SZBZshTj+U
         LxnK+vd//fGSLoi86mPo92vFdGapXE8i/z+pONRKRnHjnl7UcCAlnttbrxHJsY0sIDqk
         5r8KRLKaTdsDQmIPI3r1YzB9RC41rkawRnM4ZjuhYrVJB+gM+m3EUIskTf2ivG1ONtIn
         2xo8XhUdDshlOSkcPEcvhkjQKTV7WkPAhKuscXh9L1Lg1e2RbF8Cx3tC6k2x6HjH2vU7
         jobA==
X-Gm-Message-State: AOAM5309TmxsepVMpg5P3HIPTFGp6lPSqxdK5rI3lJfGbd6ZbLVDSNaf
	ThKhAlHMqfvtfwAO3MOnqhNoYt1YbvvkBs1I+X3Oc/lGiO7l+A==
X-Google-Smtp-Source: ABdhPJx8pz5RVwGsd3SOgzFwcWxkjBf6tw9WxTmsFEBs+UaymELbFzH+09+ZQKOha64sC+sz67rCzyMqGglHmiBs3n0=
X-Received: by 2002:a19:7106:0:b0:478:68b5:86d9 with SMTP id
 m6-20020a197106000000b0047868b586d9mr19573199lfc.417.1653656517697; Fri, 27
 May 2022 06:01:57 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000d0437b05dffdd1de@google.com>
In-Reply-To: <000000000000d0437b05dffdd1de@google.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Fri, 27 May 2022 15:01:46 +0200
Message-ID: <CACT4Y+Y8DOKJtwhRsyNT7G26C3Fx_oeibpXn43Ks0RtYYdZG3g@mail.gmail.com>
Subject: Re: [syzbot] riscv/fixes test error: lost connection to test machine
To: syzbot <syzbot+2c5da6a0a16a0c4f34aa@syzkaller.appspotmail.com>
Cc: aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	syzkaller-bugs@googlegroups.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220527_060203_398577_30D5D11E 
X-CRM114-Status: UNSURE (   9.00  )
X-CRM114-Notice: Please train this message.
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

T24gRnJpLCAyNyBNYXkgMjAyMiBhdCAxNDo1NSwgc3l6Ym90CjxzeXpib3QrMmM1ZGE2YTBhMTZh
MGM0ZjM0YWFAc3l6a2FsbGVyLmFwcHNwb3RtYWlsLmNvbT4gd3JvdGU6Cj4KPiBIZWxsbywKPgo+
IHN5emJvdCBmb3VuZCB0aGUgZm9sbG93aW5nIGlzc3VlIG9uOgo+Cj4gSEVBRCBjb21taXQ6ICAg
IGM5MzJlZGVhZjZkNiByaXNjdjogZHRzOiBtaWNyb2NoaXA6IGZpeCBncGlvMSByZWcgcHJvcGVy
dHkuLgo+IGdpdCB0cmVlOiAgICAgICBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4
L2tlcm5lbC9naXQvcmlzY3YvbGludXguZ2l0IGZpeGVzCj4gY29uc29sZSBvdXRwdXQ6IGh0dHBz
Oi8vc3l6a2FsbGVyLmFwcHNwb3QuY29tL3gvbG9nLnR4dD94PTE0MThhZGQ1ZjAwMDAwCj4ga2Vy
bmVsIGNvbmZpZzogIGh0dHBzOi8vc3l6a2FsbGVyLmFwcHNwb3QuY29tL3gvLmNvbmZpZz94PWFh
NmI1NzAyYmRmMTRhMTcKPiBkYXNoYm9hcmQgbGluazogaHR0cHM6Ly9zeXprYWxsZXIuYXBwc3Bv
dC5jb20vYnVnP2V4dGlkPTJjNWRhNmEwYTE2YTBjNGYzNGFhCj4gY29tcGlsZXI6ICAgICAgIHJp
c2N2NjQtbGludXgtZ251LWdjYyAoRGViaWFuIDEwLjIuMS02KSAxMC4yLjEgMjAyMTAxMTAsIEdO
VSBsZCAoR05VIEJpbnV0aWxzIGZvciBEZWJpYW4pIDIuMzUuMgo+IHVzZXJzcGFjZSBhcmNoOiBy
aXNjdjY0Cj4KPiBJTVBPUlRBTlQ6IGlmIHlvdSBmaXggdGhlIGlzc3VlLCBwbGVhc2UgYWRkIHRo
ZSBmb2xsb3dpbmcgdGFnIHRvIHRoZSBjb21taXQ6Cj4gUmVwb3J0ZWQtYnk6IHN5emJvdCsyYzVk
YTZhMGExNmEwYzRmMzRhYUBzeXprYWxsZXIuYXBwc3BvdG1haWwuY29tCgpUaGUgQ09ORklHX0tB
U0FOX1ZNQUxMT0MgYWxsb3dzIHJpc2N2IGtlcm5lbCB0byBib290LCBidXQgbm93IEdvCnByb2Nl
c3NlcyBzdGFydGVkIGNyYXNoaW5nIHdpdGg6CgoxOTcwLzAxLzAxIDAwOjA2OjU1IGZ1enplciBz
dGFydGVkCnJ1bnRpbWU6IGxmc3RhY2sucHVzaCBpbnZhbGlkIHBhY2tpbmc6IG5vZGU9MHhmZmZm
ZmY1OTA4YTk0MCBjbnQ9MHgxCnBhY2tlZD0weGZmZmY1OTA4YTk0MDAwMDEgLT4gbm9kZT0weGZm
ZmY1OTA4YTk0MApmYXRhbCBlcnJvcjogbGZzdGFjay5wdXNoCnJ1bnRpbWUgc3RhY2s6CnJ1bnRp
bWUudGhyb3coezB4MzA4ODRjLCAweGN9KQovdXNyL2xvY2FsL2dvL3NyYy9ydW50aW1lL3Bhbmlj
LmdvOjExOTggKzB4NjAKcnVudGltZS4oKmxmc3RhY2spLnB1c2goMHhkYjM4NTAsIDB4ZmZmZmZm
NTkwOGE5NDApCi91c3IvbG9jYWwvZ28vc3JjL3J1bnRpbWUvbGZzdGFjay5nbzozMCArMHgxYTgK
CkdvIHJ1bnRpbWUgdHJpZXMgdG8gc2hvdmUgc29tZSBkYXRhIGludG8gdGhlIHVwcGVyIDE2IGJp
dHMgb2YgcG9pbnRlcnMKYXNzdW1pbmcgdGhleSBhcmUgdW51c2VkLgpIb3dldmVyLCB0aGUgb3Jp
Z2luYWwgcG9pbnRlciBub2RlPTB4ZmZmZmZmNTkwOGE5NDAgc3VnZ2VzdCByaXNjdiBub3cKaGFz
IDU2LWJpdCB1c2Vycy1zcGFjZSBhZGRyZXNzIHNwYWNlPwpEb2N1bWVudGF0aW9uL3Jpc2N2L3Zt
LWxheW91dC5yc3QgY2xhaW1zIDQ4LWJpdCBwb2ludGVyczoKIgpUaGUgUklTQy1WIHByaXZpbGVn
ZWQgYXJjaGl0ZWN0dXJlIGRvY3VtZW50IHN0YXRlcyB0aGF0IHRoZSA2NGJpdCBhZGRyZXNzZXMK
Im11c3QgaGF2ZSBiaXRzIDYz4oCTNDggYWxsIGVxdWFsIHRvIGJpdCA0Nywgb3IgZWxzZSBhIHBh
Z2UtZmF1bHQgZXhjZXB0aW9uIHdpbGwKb2NjdXIuIjoKLi4uCiAgIDAwMDAwMDAwMDAwMDAwMDAg
fCAgICAwICAgICAgIHwgMDAwMDAwM2ZmZmZmZmZmZiB8ICAyNTYgR0IgfAp1c2VyLXNwYWNlIHZp
cnR1YWwgbWVtb3J5LCBkaWZmZXJlbnQgcGVyIG1tCiIKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
