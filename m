Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04369EC8748
	for <linux-riscv@archiver.kernel.org>; Sun, 10 Sep 2023 09:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j9+WRNXzw+dDoCedvt3HpX8SwjEX9lG/Ove29xDCKx0=; b=w/rgdh8Tm4R1Oz
	CTSbjIDEesTWEe16bvGSccKErif9Sm7m+fOnwJS4/UCJbw0NDDDXeBPIOz7BkwpgkzX6xo0xEZ2Y0
	mlhD0nKLb3dj0JCn18GjukeKIQFKNNV/05f0ayjvS+2/6gaXn2Nm3LsMByjshKINZQjsYJ07YNdXn
	irpCSVfqgW2TKhsAhsFoMnzZanVfRyB1xTKYMzV3I8ijdWmSAmOp2NAdBh+lNp2Xi/82eodMdSDg/
	jzMeoIT2Hxdrda2n7xYgPT0ztVx6pn7w0+zl1PtoXDsFb1Mq3vzXDGm4tLE6gyu5BaPzpjMBeNMET
	s1seh7hsf4gt2TZNwdug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfGd5-00GKqo-04;
	Sun, 10 Sep 2023 09:21:19 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfGd2-00GKqB-0e
	for linux-riscv@lists.infradead.org;
	Sun, 10 Sep 2023 09:21:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 077DBB80AF4
	for <linux-riscv@lists.infradead.org>; Sun, 10 Sep 2023 09:21:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22D98C433CB
	for <linux-riscv@lists.infradead.org>; Sun, 10 Sep 2023 09:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694337671;
	bh=AlyEU5ZmUJpXNyW6VvERlx1GXg+wiqJaSqdE/H8q0SE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=dviYAmRowpTZs8iTDclyQhazyZEdoVHJE1rcEbdqY5ipcQfvm6hU8pKE/O5Lz3z7G
	 Z9aEoEc29zD5SpNs2CMSeVl0Jif+Jyr5BjexOeQWwsNUaglD2SFFLfgpNBVhSTehzm
	 hctVm3dmLkmvdhGFQPRqpXrhIDMMAQyuk563+4buwYIPXPDM/xtsjWsEHkXp9mttrx
	 6Lm5iVDLfiAclK5pHVbn3uQl4eHyaAAXbJoVPIecZ0prlzWW6MbcveasUKN593DfFA
	 8ch/AXxImjkMOGy6sZ7eyWv6Ne8OPVVl9uB6PM1VEu0zTetBir9chJaDCMzrFc5tWX
	 yaqXRMF0LGqdA==
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-52683b68c2fso4571765a12.0
        for <linux-riscv@lists.infradead.org>; Sun, 10 Sep 2023 02:21:11 -0700 (PDT)
X-Gm-Message-State: AOJu0YzaPzCQMdNuSgBCfI4JoHlUMJmH/t3iqghIGycf4jjA8yx6KGUq
	KCbf5kmUdlGYkVpvA6HGlc3ZYDt3Cvdz2HRM3UE=
X-Google-Smtp-Source: AGHT+IHDx5Z78daTy57oiBDgIHdhGAgHNt80St8yuq4TUxSMbDnzstsa/h7QWOtF1DxMV7X1XMgkpqZGKZeGSZA/jp0=
X-Received: by 2002:aa7:d6c8:0:b0:526:9626:e37d with SMTP id
 x8-20020aa7d6c8000000b005269626e37dmr5860593edr.37.1694337669530; Sun, 10 Sep
 2023 02:21:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230910082911.3378782-1-guoren@kernel.org> <20230910-esteemed-exodus-706aaae940b1@spud>
 <CAJF2gTRQd_dNuZHNwfg3SwD0XERaYXYUdFUFQiarym40kpxFRQ@mail.gmail.com>
In-Reply-To: <CAJF2gTRQd_dNuZHNwfg3SwD0XERaYXYUdFUFQiarym40kpxFRQ@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Sun, 10 Sep 2023 17:20:58 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQz8Hea=8SL2X_CVKd+14V+VDL=d5oRDrTjDNmew+0aQA@mail.gmail.com>
Message-ID: <CAJF2gTQz8Hea=8SL2X_CVKd+14V+VDL=d5oRDrTjDNmew+0aQA@mail.gmail.com>
Subject: Re: [PATCH V11 00/17] riscv: Add Native/Paravirt qspinlock support
To: Conor Dooley <conor@kernel.org>
Cc: paul.walmsley@sifive.com, anup@brainfault.org, peterz@infradead.org, 
	mingo@redhat.com, will@kernel.org, palmer@rivosinc.com, longman@redhat.com, 
	boqun.feng@gmail.com, tglx@linutronix.de, paulmck@kernel.org, 
	rostedt@goodmis.org, rdunlap@infradead.org, catalin.marinas@arm.com, 
	conor.dooley@microchip.com, xiaoguang.xing@sophgo.com, bjorn@rivosinc.com, 
	alexghiti@rivosinc.com, keescook@chromium.org, greentime.hu@sifive.com, 
	ajones@ventanamicro.com, jszhang@kernel.org, wefu@redhat.com, 
	wuwei2016@iscas.ac.cn, leobras@redhat.com, linux-arch@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org, 
	kvm@vger.kernel.org, virtualization@lists.linux-foundation.org, 
	linux-csky@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230910_022116_509049_FA3F11CA 
X-CRM114-Status: GOOD (  15.40  )
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

T24gU3VuLCBTZXAgMTAsIDIwMjMgYXQgNToxNuKAr1BNIEd1byBSZW4gPGd1b3JlbkBrZXJuZWwu
b3JnPiB3cm90ZToKPgo+IE9uIFN1biwgU2VwIDEwLCAyMDIzIGF0IDQ6NTjigK9QTSBDb25vciBE
b29sZXkgPGNvbm9yQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4KPiA+IE9uIFN1biwgU2VwIDEwLCAy
MDIzIGF0IDA0OjI4OjU0QU0gLTA0MDAsIGd1b3JlbkBrZXJuZWwub3JnIHdyb3RlOgo+ID4KPiA+
ID4gQ2hhbmdsb2c6Cj4gPiA+IFYxMToKPiA+ID4gIC0gQmFzZWQgb24gTGVvbmFyZG8gQnJhcydz
IGNtcHhjaGdfc21hbGwgcGF0Y2hlcyB2NS4KPiA+ID4gIC0gQmFzZWQgb24gR3VvIFJlbidzIE9w
dGltaXplIGFyY2hfc3Bpbl92YWx1ZV91bmxvY2tlZCBwYXRjaCB2My4KPiA+ID4gIC0gUmVtb3Zl
IGFidXNpbmcgYWx0ZXJuYXRpdmUgZnJhbWV3b3JrIGFuZCB1c2UganVtcF9sYWJlbCBpbnN0ZWFk
Lgo+ID4KPiA+IGJ0dywgSSBkaWRuJ3Qgc2F5IHRoYXQgdXNpbmcgYWx0ZXJuYXRpdmVzIHdhcyB0
aGUgcHJvYmxlbSwgaXQgd2FzCj4gPiBhYnVzaW5nIHRoZSBlcnJhdGEgZnJhbWV3b3JrIHRvIHBl
cmZvcm0gZmVhdHVyZSBkZXRlY3Rpb24gdGhhdCBJIGhhZAo+ID4gYSBwcm9ibGVtIHdpdGguIFRo
YXQncyBub3QgY2hhbmdlZCBpbiB2MTEuCj4gSSd2ZSByZW1vdmVkIGVycmF0YSBmZWF0dXJlIGRl
dGVjdGlvbi4gVGhlIG9ubHkgcmVsYXRlZCBwYXRjaGVzIGFyZToKPiAgLSByaXNjdjogcXNwaW5s
b2NrOiBlcnJhdGE6IEFkZCBFUlJBVEFfVEhFQURfV1JJVEVfT05DRSBmaXh1cAo+ICAtIHJpc2N2
OiBxc3BpbmxvY2s6IGVycmF0YTogRW5hYmxlIHFzcGlubG9jayBmb3IgVC1IRUFEIHByb2Nlc3Nv
cnMKQW5kIHRoaXMgb25lOgogLSByaXNjdjogVXNlIFppY2JvcCBpbiBhcmNoX3hjaGcgd2hlbiBh
dmFpbGFibGUKCj4KPiBXaGljaCBvbmUgaXMgeW91ciBjb25jZXJuPyBDb3VsZCB5b3UgcmVwbHkg
b24gdGhlIGV4YWN0IHBhdGNoIHRocmVhZD8gVGh4Lgo+Cj4gPgo+ID4gQSBzdHJvbmdlciBmb3J3
YXJkIHByb2dyZXNzIGd1YXJhbnRlZSBpcyBub3QgYW4gZXJyYXR1bSwgQUZBSUNULgo+IFNvcnJ5
LCB0aGVyZSBpcyBubyBlcnJhdHVtIG9mICJzdHJvbmdlciBmb3J3YXJkIHByb2dyZXNzIGd1YXJh
bnRlZSIgaW4gdGhlIFYxMS4KPgo+ID4KPiA+ID4gIC0gSW50cm9kdWNlIHByZWZldGNoLncgdG8g
aW1wcm92ZSBULUhFQUQgcHJvY2Vzc29ycycgTFIvU0MgZm9yd2FyZCBwcm9ncmVzcwo+ID4gPiAg
ICBndWFyYW50ZWUuCj4gPiA+ICAtIE9wdGltaXplIHFzcGlubG9jayB4Y2hnX3RhaWwgd2hlbiBO
Ul9DUFVTID49IDE2Sy4KPgo+Cj4KPiAtLQo+IEJlc3QgUmVnYXJkcwo+ICBHdW8gUmVuCgoKCi0t
IApCZXN0IFJlZ2FyZHMKIEd1byBSZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
