Return-Path: <SRS0=/EkZ=I3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9C93C433C1
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Mar 2021 22:42:09 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3FFEC61989
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Mar 2021 22:42:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3FFEC61989
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yRfckiCNMnL0rippNaaTtLkZR5OMC4v0fYeorlluq2I=; b=ChbHobiU9WfG6xBf0H1oRAjCG
	08+lgkCkiRlLsAkE8fFScY2TImgYnxicpgsd9vDgjxyMtRW9hversEKWvugWSBG/8tPPmQ569UKsy
	JJ0hE3sVp+czJSKml/er47P/xyZ0laCyp2HuWichbryIOUmzaiItrJD/sGtMjN3vQPN094pc51rVV
	Rl89fF16YrbyNLH/ytLI2dAJtbv9o/vyw/UwP0cAbMdz126L+yPRRSwlE/WoScGIQsCOt9d5crPvW
	KB8ecOpjb4hlRjBB+6caa3/7iR0Cux//lGnBL4SNIzeLTquxD0UzqDax7lgoZJJkb/xA0McTjrgsL
	yCGlbrLng==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lR0Z3-001jYR-Mz; Mon, 29 Mar 2021 22:40:53 +0000
Received: from mout.kundenserver.de ([212.227.126.130])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQsNg-000hHG-Rp
 for linux-riscv@lists.infradead.org; Mon, 29 Mar 2021 13:56:39 +0000
Received: from mail-oi1-f179.google.com ([209.85.167.179]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1N2SXX-1ld4Jz2BJv-013s1P for <linux-riscv@lists.infradead.org>; Mon, 29 Mar
 2021 15:56:32 +0200
Received: by mail-oi1-f179.google.com with SMTP id z15so13138929oic.8
 for <linux-riscv@lists.infradead.org>; Mon, 29 Mar 2021 06:56:29 -0700 (PDT)
X-Gm-Message-State: AOAM530OmqDmzoGyann+w5KmaMoWMtqltqrP69GYj49VOh2jS/XzefLv
 VkyoXVSmrSATD49dOt+6VeamXlLsFu84Owxa3Zw=
X-Google-Smtp-Source: ABdhPJy0vJalLgX9WOoI4FQEZJ7ly3VUocO7/EsGYULttaQFdCVk5swQHlGoklL1MAn8jh7Q3Vrvjf5tWz+qCh9IZ/U=
X-Received: by 2002:a05:6808:313:: with SMTP id
 i19mr18216138oie.67.1617026188151; 
 Mon, 29 Mar 2021 06:56:28 -0700 (PDT)
MIME-Version: 1.0
References: <1616868399-82848-1-git-send-email-guoren@kernel.org>
 <1616868399-82848-4-git-send-email-guoren@kernel.org>
 <YGGGqftfr872/4CU@hirez.programming.kicks-ass.net>
 <CAK8P3a2bNH-1VjsZmZJkvGzzZY=ckaaOK9ZGL-oD0DH4jW-+kQ@mail.gmail.com>
 <YGG3JIBVO0w6W3fg@hirez.programming.kicks-ass.net>
 <YGG6Ms5Rl0AOJL2i@hirez.programming.kicks-ass.net>
 <CAJF2gTRwd0QpUZumDFUN1J=effv67ucUdsQ96PJwjBhPgJ1npw@mail.gmail.com>
In-Reply-To: <CAJF2gTRwd0QpUZumDFUN1J=effv67ucUdsQ96PJwjBhPgJ1npw@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 29 Mar 2021 15:56:13 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3jpQ7dDiVG0s_DQiL6n_MdnhYHMjqFfJ92JJBJFPQZPQ@mail.gmail.com>
Message-ID: <CAK8P3a3jpQ7dDiVG0s_DQiL6n_MdnhYHMjqFfJ92JJBJFPQZPQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] locking/qspinlock: Add
 ARCH_USE_QUEUED_SPINLOCKS_XCHG32
To: Guo Ren <guoren@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, 
 linux-arch <linux-arch@vger.kernel.org>, Guo Ren <guoren@linux.alibaba.com>, 
 Will Deacon <will@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Waiman Long <longman@redhat.com>, Anup Patel <anup@brainfault.org>,
 Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
X-Provags-ID: V03:K1:Os5G+n78gw98CG+CHjErhzV7KltTE000tdlgUDhjy3UBYrAInqa
 SxIOXrvncc/Qw034/wJNaBpSLWqOdOOUYDrBwgQ9EHdry4rFWSEzzHOF4b+QF9fdK9oPIy/
 5EGNnDhIshBQIZYSahL3ahEXIOtKw4NR0FGVcbBmQknZndGgw00k9te4VZkJSCnSJSD9Suv
 71pfauSkllnufXMrXh0NQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:qBiyhgle7Cc=:gKVvaxf+96DD415ynE8BYo
 XJ7p5WXS3WjavvrNAKTtq7IqMrB38tjYE7+Er9c9dfVF4tV0O4ydCOs9gBNf2VzfvQD4D2XXX
 XYN87eDQvNbVBlRdTrhBgS+eadrSs98HsAySdT6MBJTLG4DqXF6CWSePwWbSENqGtDCDj8o3U
 mg0xymQQdkhNm80VCO3J9adqTMxK3CwdmW7J2j3tYUrPwjxRHaQohZKRgzRk1wSiHC+fFC0YJ
 KTNKeYPqeJJuqDS2/6/LrZlD/nAIaB/AoD8WGZJFZLt74GsbGa4AyNKGfJYWyO0C4UiSV4bqx
 mZvp5q5qQjie+UwTAy7DF+HosLvMoFLiL07OiIjSoCsisvccu9yGgXWKPbSRlkH2fuk2ukfTy
 poMkNdFij0MxKZdbwFzVyhZMzdSA5ufisXqimpXxdeJDZ9FzCyyBd0ZG2blMfiRQJ414X5AXP
 NXLLPJJXrgtjgzrXvrMQyeJnUSxh1HMGALZurBG54ngwWYbaQmc1DXYb2PqZwT4KwfNAaJARV
 dvofO8cGrT8O0XV2FOQIkUfxNZyBE8xz2phPom4zVrpZBdvFbHnQP61Pqi34SGI8r9joPdnUK
 1gBaHZOLlJbU1x+hkI4lSEQxNad5Rsa3hh
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210329_145637_753843_A544E426 
X-CRM114-Status: GOOD (  22.05  )
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

T24gTW9uLCBNYXIgMjksIDIwMjEgYXQgMjo1MiBQTSBHdW8gUmVuIDxndW9yZW5Aa2VybmVsLm9y
Zz4gd3JvdGU6Cj4KPiBPbiBNb24sIE1hciAyOSwgMjAyMSBhdCA3OjMxIFBNIFBldGVyIFppamxz
dHJhIDxwZXRlcnpAaW5mcmFkZWFkLm9yZz4gd3JvdGU6Cj4gPgo+ID4gT24gTW9uLCBNYXIgMjks
IDIwMjEgYXQgMDE6MTY6NTNQTSArMDIwMCwgUGV0ZXIgWmlqbHN0cmEgd3JvdGU6Cj4gPiA+IEFu
eXdheSwgYW4gYWRkaXRpb25hbCAnZnVubnknIGlzIHRoYXQgSSBzdXNwZWN0IHlvdSBjYW5ub3Qg
cHJvdmUgZndkCj4gPiA+IHByb2dyZXNzIG9mIHRoZSBlbnRpcmUgcHJpbWl0aXZlIHdpdGggYW55
IG9mIHRoaXMgb24uIEJ1dCB3aG8gY2FyZXMKPiA+ID4gYWJvdXQgZGV0YWlscyBhbnl3YXkuLiA6
Lwo+ID4KPiA+IFdoYXQncyB0aGUgYXJjaGl0ZWN0dXJhbCBndWFyYW50ZWUgb24gTEwvU0MgcHJv
Z3Jlc3MgZm9yIFJJU0MtViA/Cj4KPiBmdW5jdDUgICAgfCBhcSB8IHJsICAgfCByczIgfCAgcnMx
ICB8IGZ1bmN0MyB8IHJkIHwgb3Bjb2RlCj4gICAgICA1ICAgICAgICAgIDEgICAgMSAgICAgIDUg
ICAgICAgNSAgICAgICAgIDMgICAgICAgIDUgICAgICAgICAgNwo+IExSLlcvRCAgb3JkZXJpbmcg
IDAgICAgIGFkZHIgICAgd2lkdGggICBkZXN0ICAgIEFNTwo+IFNDLlcvRCAgb3JkZXJpbmcgIHNy
YyAgYWRkciAgICB3aWR0aCAgIGRlc3QgICAgQU1PCj4KPiBMUi5XIGxvYWRzIGEgd29yZCBmcm9t
IHRoZSBhZGRyZXNzIGluIHJzMSwgcGxhY2VzIHRoZSBzaWduLWV4dGVuZGVkCj4gdmFsdWUgaW4g
cmQsIGFuZCByZWdpc3RlcnMgYSByZXNlcnZhdGlvbiBzZXTigJRhIHNldCBvZiBieXRlcyB0aGF0
Cj4gc3Vic3VtZXMgdGhlIGJ5dGVzIGluIHRoZSBhZGRyZXNzZWQgd29yZC4gU0MuVyBjb25kaXRp
b25hbGx5IHdyaXRlcyBhCj4gd29yZCBpbiByczIgdG8gdGhlIGFkZHJlc3MgaW4gcnMxOiB0aGUg
U0MuVyBzdWNjZWVkcyBvbmx5IGlmIHRoZQo+IHJlc2VydmF0aW9uIGlzIHN0aWxsIHZhbGlkIGFu
ZCB0aGUgcmVzZXJ2YXRpb24gc2V0IGNvbnRhaW5zIHRoZSBieXRlcwo+IGJlaW5nIHdyaXR0ZW4u
IElmIHRoZSBTQy5XIHN1Y2NlZWRzLCB0aGUgaW5zdHJ1Y3Rpb24gd3JpdGVzIHRoZSB3b3JkCj4g
aW4gcnMyIHRvIG1lbW9yeSwgYW5kIGl0IHdyaXRlcyB6ZXJvIHRvIHJkLiBJZiB0aGUgU0MuVyBm
YWlscywgdGhlCj4gaW5zdHJ1Y3Rpb24gZG9lcyBub3Qgd3JpdGUgdG8gbWVtb3J5LCBhbmQgaXQg
d3JpdGVzIGEgbm9uemVybyB2YWx1ZSB0bwo+IHJkLiBSZWdhcmRsZXNzIG9mIHN1Y2Nlc3Mgb3Ig
ZmFpbHVyZSwgZXhlY3V0aW5nIGFuIFNDLlcgaW5zdHJ1Y3Rpb24KPiAqaW52YWxpZGF0ZXMgYW55
IHJlc2VydmF0aW9uIGhlbGQgYnkgdGhpcyBoYXJ0Ki4KPgo+IE1vcmUgZGV0YWlscywgcmVmOgo+
IGh0dHBzOi8vZ2l0aHViLmNvbS9yaXNjdi9yaXNjdi1pc2EtbWFudWFsCgpJIHRoaW5rIHNlY3Rp
b24gIjMuNS4zLjIgUmVzZXJ2YWJpbGl0eSBQTUEiIFsxXSB3b3VsZCBiZSBhIG1vcmUgcmVsZXZh
bnQKbGluaywgYXMgdGhpcyBkZWZpbmVzIG1lbW9yeSBhcmVhcyB0aGF0IGVpdGhlciBkbyBvciBk
byBub3QgaGF2ZQpmb3J3YXJkIHByb2dyZXNzIGd1YXJhbnRlZXMsIGluY2x1ZGluZyB0aGlzIHBh
cnQ6CgogICAiV2hlbiBMUi9TQyBpcyB1c2VkIGZvciBtZW1vcnkgbG9jYXRpb25zIG1hcmtlZCBS
c3J2Tm9uRXZlbnR1YWwsCiAgICAgc29mdHdhcmUgc2hvdWxkIHByb3ZpZGUgYWx0ZXJuYXRpdmUg
ZmFsbC1iYWNrIG1lY2hhbmlzbXMgdXNlZCB3aGVuCiAgICAgbGFjayBvZiBwcm9ncmVzcyBpcyBk
ZXRlY3RlZC4iCgpNeSByZWFkaW5nIG9mIHRoaXMgaXMgdGhhdCBpZiB0aGUgZXhhbXBsZSB5b3Ug
dHJpZWQgc3RhbGxzLCB0aGVuIGVpdGhlcgp0aGUgUE1BIGlzIG5vdCBSc3J2RXZlbnR1YWwsIGFu
ZCBpdCBpcyB3cm9uZyB0byByZWx5IG9uIGxsL3NjIG9uIHRoaXMsCm9yIHRoYXQgdGhlIFBNQSBp
cyBtYXJrZWQgUnNydkV2ZW50dWFsIGJ1dCB0aGUgaW1wbGVtZW50YXRpb24gaXMKYnVnZ3kuCgpJ
dCBhbHNvIHNlZW1zIHRoYXQgdGhlIGN1cnJlbnQgImFtb3N3YXAiIGJhc2VkIGltcGxlbWVudGF0
aW9uCndvdWxkIGJlIHJlbGlhYmxlIGluZGVwZW5kZW50IG9mIFJzcnZFdmVudHVhbC9Sc3J2Tm9u
RXZlbnR1YWwuCmFybTY0IGlzIGFscmVhZHkgaW4gdGhlIHNpdHVhdGlvbiBvZiBoYXZpbmcgdG8g
Y2hvb3NlIGJldHdlZW4KdHdvIGNtcHhjaGcoKSBpbXBsZW1lbnRhdGlvbiBhdCBydW50aW1lIHRv
IGFsbG93IGZhbGxpbmcgYmFjayB0bwphIHNsb3dlciBidXQgbW9yZSBnZW5lcmFsIHZlcnNpb24s
IGJ1dCBpdCdzIGJlc3QgdG8gYXZvaWQgdGhhdCBpZiB5b3UKY2FuLgoKICAgICAgICAgQXJuZAoK
WzFdIGh0dHA6Ly93d3cuZml2ZS1lbWJlZGRldi5jb20vcmlzY3YtaXNhLW1hbnVhbC9sYXRlc3Qv
bWFjaGluZS5odG1sI2F0b21pY2l0eS1wbWFzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
