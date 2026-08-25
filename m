Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A72EC5DF9C
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Aug 2026 01:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SM4IafPv1DpbSDq7vAePhCTy+6Cw05A2CcsR1qNc7Jo=; b=EsdoVYE7BLtIPI
	r00F3dPQ0GhzQiYBREgu32WeLj9ZT+tuMziYzulb/t31CJAeZY5UNF2LQUWcjgh30LyiyBWmRHLUi
	lZeIPeSQnjAej90ySeOapmmcWgsKlxALwMlg9BYO2GuTUdYrwecSxGgS+L0gbU7jVp8ZjIkXA138e
	tqZIHV+T9R9ExG2qpVjCf9N5AmLqF0p9dtmOUDXZkoSHM45QX5GNZI39rPc7Qe/Qj19acRMN91MG9
	MjD2Jh/Oyt2o26HQdridOf1qS0dzAPFlOkqCUUSmJ4Z8SP8R6EdeJBkpqt/aXedUIaT3r4LW2I8Ja
	L8aD9GeqrVC1tuWEZhvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyfwH-000000000hq-1Bto;
	Tue, 25 Aug 2026 01:26:57 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyfwC-000000000hB-2jsC
	for linux-riscv@lists.infradead.org;
	Tue, 25 Aug 2026 01:26:53 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-472326ca506so2161223f8f.2
        for <linux-riscv@lists.infradead.org>; Mon, 24 Aug 2026 18:26:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787621210; cv=none;
        d=google.com; s=arc-20260327;
        b=LU/EnScmMsT76lGVJLjonEzes6fTq03jS5AqSeTo17nnpeyuxh1PVG0lUsxuZfWGii
         IY6r2UvEtCjLHkRaFvF1q9HBIybfKLUwspyv0ueknebd1PfcXpj0PGCkrD8tUBTeg4lS
         CJXoCRMYYh6s4T/Nfxov7BCKIS67dMPHmgxxtPYPWYUXs7+XToAEjuiIjBN75M8MXWSr
         lFVrG1Uq8ilNACWofnQDdrvAlroU9SkWKoob0JybGk335X2np68reImrdTGaRxe70bJr
         YAZ55KyNQAxR9TGOWJADScKq9HUxpAELGmXI6fL8dJjvdr4iK/CNpmmMMx0WdqxVbi/+
         mo1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iktd8Otr4KYJd2KrNLYJICP0BzSASamEip9qAoyyZEs=;
        fh=CHyorWNpPnRO41c5yqLv8CyNE9lENccbXCFWGO7Rv0M=;
        b=lOso92jfIXAATPMeZVu1RHXlvZaAl51w7MmF8nohsQMcJlBIx9Q77Bq59jiqbqtpmW
         ZfQbl/Nk/C1W0GXU0GcTPqaj+iIdmsewB3eZwzZ3xfrhr50EKYjDXwnJ/y+EDNkfQW95
         5sYFQ83orloYnWBXrgMyeObZZ2vH0LjQU4YWmJGkcLyfzHGcYzMgDT2+0rhKeHIAhksL
         gqjIeiqLxrBwx/oCqvvYuLOyCIwPR66xIppf5zUzPhGnqBiLFvQRq/TlHVdpWYREo7Cj
         5cAgspaMzzK1zrUCfFKDo2vxhgTNPbcKu3t+/R6yN2bRz/w0V61QP9zm3xUoJXyW+0rE
         quJg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1787621210; x=1788226010; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iktd8Otr4KYJd2KrNLYJICP0BzSASamEip9qAoyyZEs=;
        b=nHFdvcK38qZsTwMgCKffM1JURXmbDVFkGf7TDCZaT40vhYwuXJbBvL57RXvo9/ffAQ
         wDW4P4E4+J9ZLFtLqL4mdRgttETmFE+5tMekm36pIpmKmRWGrChd1T7ORFMutLIOcE+h
         W3EtQcin82WGIvfDR5pd5JYNW+9px016ynRKSM2FRmOUjdGnFRPVj/a4sJy/1le9Z/8D
         aIh3+0NuBGhSWU96pVz2f0Tnn6bnOI9QL1nfRhUmnIayMjHbkP5w1MpWu4yB2MSx/fQ4
         nQSAPQh0KSVvk5I41xMjW7E9ytUM5yok1assjbKDV6Q69dwPFdO22ifd/uiMWUpH/AlD
         TOxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787621210; x=1788226010;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iktd8Otr4KYJd2KrNLYJICP0BzSASamEip9qAoyyZEs=;
        b=bbWLU5wYY08PcRbtGqdVOmD1r2iXhGeo5im2ILlPHdET6w1c1lbAkX1pboGq4VVYzX
         7bS3HEsgD2WoR0oLq7Stij9H0/Sa4Uu4Yk1cwlgB+1LCjXO5yjNL4vYlV0gs1U+oq9uA
         xAuW0AniaVHKjsFBYwHY6216iJ08fKFR5ZTm+PFETwasphQQ3a5nQBXwytDBtsellD5w
         cOlM1eL4KqjYGfuQZSWisngWVg2VbYiy81F4jH4JvNls0755tviWO5QUt+HadXGkHgkV
         JDxEKR504dn5twbcccGj8dyOvQINn4+5rurLDG6kOtcsqLshz0bVQWRjLbZ1tMezD7/U
         w9sQ==
X-Forwarded-Encrypted: i=1; AHgh+RqulSSqJvlnaeP+ZCCr96omWPfynZFUY4BX10NOg/vlgFp4LfJtz4B+sYvO5qEXTAo7TZgmK8SOnZFHwQ==@lists.infradead.org
X-Gm-Message-State: AFuF++lxo5oU/iMCS5JVvq7cKc/nE1KUVerIPQviuxtX44jm6GORxobS
	ztr0bSubj59N7HwEcHFGxBAFKHublmFandQiYeKa2HUOCYDeSEoRexBII7dkeP2PmAV3pU6Od3U
	5ffLYrBs4S66axzxkoDmJ19kR/Llt3mSFEfsCf35+rfa5qJlnZyB9pQCafJzT
X-Gm-Gg: AR+sD10eplZ6to6KhhsEDL/sBoYBcyWf/g8nvWL5oXyB7h2LhBfE6t8324Lc2sxKfzG
	a1WqObM1HuJ7tP9yzIVw+mKyWtKFbD3ne8XyJMq64sLyrBFfdANmuOd5gC3VdHevDozH+fUUMEq
	jfLYL874EJQd6WiYU1NMl525BzBtKHBu3sAs7TtrHCSinlIK8ZIhCwfXjQPbdCIj6VXQ4SDJK2e
	UwfaotteCZmeUcx30S74G8rVE0Tt4cBLzqdkbLMUb3IQwkKzaqoqpcAxzYEieGu5+MBxHQWXAZc
	6NwSiO0cSANYk616jbf5w4jKyPEdW+cFSAcbJqapEiZgPVDn36peAxvedZWU+MO9TcYDSwDi2x+
	3QhjKcRrsoxC9dLFmysMS7TMHGP+o3xUz2fKrE6JL6pNWUSTZC8YrgwmUGzHQv2+K
X-Received: by 2002:a05:6000:3104:b0:481:5003:c654 with SMTP id
 ffacd0b85a97d-482c0b633e4mr35946511f8f.7.1787621210212; Mon, 24 Aug 2026
 18:26:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260823044337.517125-1-liutong@iscas.ac.cn>
In-Reply-To: <20260823044337.517125-1-liutong@iscas.ac.cn>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 24 Aug 2026 18:26:37 -0700
X-Gm-Features: AcwNN1W7Csl59791YwXTLLUZyTeGzWpvqApCOFv05oMXKyvs3Fqf_e518aUxJ2Y
Message-ID: <CAAhSdy1kus5OsuvgUR1N4eNUPcJJkiy4tm06OOCNkP29be0D5g@mail.gmail.com>
Subject: Re: [PATCH] perf: riscv: Fix counter_idx_base in PMU snapshot restart
To: liutong <liutong@iscas.ac.cn>
Cc: Atish Patra <atish.patra@linux.dev>, Palmer Dabbelt <palmer@dabbelt.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_182652_720071_11B282C6 
X-CRM114-Status: GOOD (  16.08  )
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

T24gU2F0LCBBdWcgMjIsIDIwMjYgYXQgOTo0M+KAr1BNIGxpdXRvbmcgPGxpdXRvbmdAaXNjYXMu
YWMuY24+IHdyb3RlOgo+Cj4gSW4gcG11X3NiaV9zdGFydF9vdmZfY3Ryc19zbmFwc2hvdCgpLCBh
ZnRlciBmb3JfZWFjaF9zZXRfYml0KCkgZmluaXNoZXMKPiBpdGVyYXRpbmcgdXNlZF9od19jdHJz
W2ldLCBpZHggaXMgbGVmdCBhdCBCSVRTX1BFUl9MT05HLiBUaGUgc3Vic2VxdWVudAo+IHNiaV9l
Y2FsbCgpIHVzZXMgaWR4ICogQklUU19QRVJfTE9ORyBhcyBjb3VudGVyX2lkeF9iYXNlLCBwYXNz
aW5nIGFuCj4gb3V0LW9mLXJhbmdlIHZhbHVlICg0MDk2IG9uIDY0LWJpdCkgdG8gU0JJX0VYVF9Q
TVVfQ09VTlRFUl9TVEFSVC4KPgo+IFRoaXMgY2F1c2VzIHRoZSBmaXJtd2FyZSB0byByZWplY3Qg
dGhlIGNhbGwgYW5kIG92ZXJmbG93ZWQgY291bnRlcnMgYXJlCj4gbmV2ZXIgcmVzdGFydGVkLgo+
Cj4gVXNlIHRoZSBvdXRlciBsb29wIGluZGV4ICdpJyBpbnN0ZWFkIG9mIHRoZSBleGhhdXN0ZWQg
aXRlcmF0b3IgJ2lkeCcuCj4KPiBGaXhlczogYTg2MjUyMTdhMDU0ICgiZHJpdmVycy9wZXJmOiBy
aXNjdjogSW1wbGVtZW50IFNCSSBQTVUgc25hcHNob3QgZnVuY3Rpb24iKQo+IFNpZ25lZC1vZmYt
Ynk6IGxpdXRvbmcgPGxpdXRvbmdAaXNjYXMuYWMuY24+CgpMR1RNLgoKUmV2aWV3ZWQtYnk6IEFu
dXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CgpUaGFua3MsCkFudXAKCj4gLS0tCj4gIGRy
aXZlcnMvcGVyZi9yaXNjdl9wbXVfc2JpLmMgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGVyZi9y
aXNjdl9wbXVfc2JpLmMgYi9kcml2ZXJzL3BlcmYvcmlzY3ZfcG11X3NiaS5jCj4gaW5kZXggZGZj
ODg2ZGVlLi4wOTliYTk3NGEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9wZXJmL3Jpc2N2X3BtdV9z
YmkuYwo+ICsrKyBiL2RyaXZlcnMvcGVyZi9yaXNjdl9wbXVfc2JpLmMKPiBAQCAtMTAyMSw3ICsx
MDIxLDcgQEAgc3RhdGljIGlubGluZSB2b2lkIHBtdV9zYmlfc3RhcnRfb3ZmX2N0cnNfc25hcHNo
b3Qoc3RydWN0IGNwdV9od19ldmVudHMgKmNwdV9od18KPiAgICAgICAgICAgICAgICAgICAgICAg
ICBzZGF0YS0+Y3RyX3ZhbHVlc1tpZHhdID0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgY3B1X2h3X2V2dC0+c25hcHNob3RfY3ZhbF9zaGNvcHlbaWR4ICsgaSAqIEJJ
VFNfUEVSX0xPTkddOwo+ICAgICAgICAgICAgICAgICAvKiBTdGFydCBhbGwgdGhlIGNvdW50ZXJz
IGluIGEgc2luZ2xlIHNob3QgKi8KPiAtICAgICAgICAgICAgICAgc2JpX2VjYWxsKFNCSV9FWFRf
UE1VLCBTQklfRVhUX1BNVV9DT1VOVEVSX1NUQVJULCBpZHggKiBCSVRTX1BFUl9MT05HLAo+ICsg
ICAgICAgICAgICAgICBzYmlfZWNhbGwoU0JJX0VYVF9QTVUsIFNCSV9FWFRfUE1VX0NPVU5URVJf
U1RBUlQsIGkgKiBCSVRTX1BFUl9MT05HLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgY3B1
X2h3X2V2dC0+dXNlZF9od19jdHJzW2ldLCBmbGFnLCAwLCAwLCAwKTsKPiAgICAgICAgIH0KPiAg
fQo+IC0tCj4gMi4zNC4xCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
