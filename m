Return-Path: <SRS0=z0LS=QD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB14DC433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Nov 2021 10:17:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5FAA761BF4
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Nov 2021 10:17:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5FAA761BF4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xDSNeGaPtkrstB59tcDexdAKUzockmS2QFv9PzSEo+Q=; b=nFs25Vg3y2dESE
	AZrq07lPWUADr5He9DsEA6GfPLyVsEIDXqBTDMU+6Aw6a+vPlveoFMPxfOBS2CzXChaNo35oSXC6W
	RZgZEVXJi/wfwyV+3cSUeyiTcifFVSdstYk6sVIR/X3MyGNUet1V/5EiL+D98BSUPHbwo/4P1eYgF
	AFwIp9bqhnTNDUSG5ID+0DYNl3Jj5uQLACF6u3fg9+nkF0sWRBKbSe/Fzz+CttD6+2QyrEzCI/r3y
	M/W3QynpKqPS0AyZx21+0UDbDpItBCJzyiBiO9W51Dn0McQ2skSE8eGEksGfjoydYTb7nEwkS2jwd
	xu6PjdDlPNYSyYDBWzMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmvWj-0019dJ-3E; Tue, 16 Nov 2021 10:17:21 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmvWg-0019cG-0o
 for linux-riscv@lists.infradead.org; Tue, 16 Nov 2021 10:17:19 +0000
Received: by mail-pf1-x434.google.com with SMTP id g19so17747887pfb.8
 for <linux-riscv@lists.infradead.org>; Tue, 16 Nov 2021 02:17:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bK/sBg1C1mqhkenG14RiC+8MTOJxXLOUrcmyZaUVyW4=;
 b=fO6qLwGdeF5+TEv117IqCHwmxC6wAcvUAmkScjX8pIPgSOWX7lZXnzKtt9/0DJQzf7
 guxUyJk3eZXcPtWEU38OBSKX7PSliXkdE882G/uW4iL7TP/snLRrDeP4058Hwlogwwra
 bfVV/UaE7brD+/lCt0ibdRLOlVUMwFoCxnS2becACEJ1nLFryZG/MxXD+jiCwNcucmH0
 iU1j7qzfoRwuNi0+aDLXBarYqIoZAUi2CSgK+Z+ol76b0L5lFnhEr2CRoiXHyrxPI5gh
 vjSn1tgkeOmaVb3fJWXN95OEgQmcqs23fVbSmSy6Wch6ZSVTf9xmz8Emon3Nm7zMw9/C
 +p/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bK/sBg1C1mqhkenG14RiC+8MTOJxXLOUrcmyZaUVyW4=;
 b=Q8eSMWDc0RoWIwesHqN/MyCAvYY84N1Ewg6bzt2+zP8+2GFmaD2bPcQfQim1O4u0iA
 elYuEKVFOhyaSWRKeH68IQK3Zrvk/60GEl9mttEyWPZ5fbWe1WztEZh/5NgMEi80FQ5h
 SljTk09nLcQW6ucILRbvDPXLlNq6+iFWE1Jri33oU+dvRoHm3JzAu9Snv22LyEZaEUMC
 NbYq4IZQvhPqaCbq5mjyDJyE/QsH10QZEAbnP+FTy/RsaoZ8qEQ+ep7COvEZnr6aP9nd
 hUvhjTIBSBrUiOY5tOkWcPVSnLMgzj0vmCN8sV903zwEkb2wdi/rASWLPQYZTBia4O/x
 WXrA==
X-Gm-Message-State: AOAM532Q1BRsmZe8JbNGShJTu++8cnQGkikQfYnVrmYg0eg8PADTxn/D
 3BPFieuC7lWjxTX3E9YbSyQ=
X-Google-Smtp-Source: ABdhPJwcPgRjL6cWhG7a5Aah8i0pQlt+CeWTnvNnrq5EfYPd9UdjMvWVAjqqcMK7Dt73jhnKjln5Ig==
X-Received: by 2002:a05:6a00:a8e:b0:480:ab08:1568 with SMTP id
 b14-20020a056a000a8e00b00480ab081568mr39520666pfl.28.1637057836076; 
 Tue, 16 Nov 2021 02:17:16 -0800 (PST)
Received: from localhost.lan (p4899162-ipngn25301marunouchi.tokyo.ocn.ne.jp.
 [122.18.9.162])
 by smtp.gmail.com with ESMTPSA id lp12sm2350797pjb.24.2021.11.16.02.17.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 02:17:15 -0800 (PST)
Received: from localhost (localhost [IPv6:::1])
 by localhost.lan (Postfix) with ESMTPSA id 7B272900949;
 Tue, 16 Nov 2021 10:17:13 +0000 (GMT)
Date: Tue, 16 Nov 2021 10:17:13 +0000
From: Vincent Pelletier <plr.vincent@gmail.com>
To: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
Cc: Rob Herring <robh+dt@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Krzysztof Kozlowski
 <krzysztof.kozlowski@canonical.com>, Qiu Wenbo <qiuwenbo@kylinos.com.cn>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, David Abdurachmanov
 <david.abdurachmanov@sifive.com>
Subject: Re: [PATCH] riscv: dts: sifive unmatched: Name gpio lines.
Message-ID: <20211116101713.77a0df69@gmail.com>
In-Reply-To: <11612716.TMCrJ2abzX@diego>
References: <f6512cc50dc31a086e00ed59c63ea60d8c148fc4.1637023980.git.plr.vincent@gmail.com>
 <11612716.TMCrJ2abzX@diego>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211116_021718_106297_46CE9C33 
X-CRM114-Status: GOOD (  22.81  )
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

SGVsbG8sCgpPbiBUdWUsIDE2IE5vdiAyMDIxIDEwOjM5OjA0ICswMTAwLCBIZWlrbyBTdMO8Ym5l
ciA8aGVpa29Ac250ZWNoLmRlPiB3cm90ZToKPiBIaSBWaW5jZW50LAo+IAo+IEFtIERpZW5zdGFn
LCAxNi4gTm92ZW1iZXIgMjAyMSwgMDE6NTI6NTYgQ0VUIHNjaHJpZWIgVmluY2VudCBQZWxsZXRp
ZXI6Cj4gPiBGb2xsb3cgdGhlIHBpbiBkZXNjcmlwdGlvbnMgZ2l2ZW4gaW4gdGhlIHZlcnNpb24g
MyBvZiB0aGUgYm9hcmQgc2NoZW1hdGljcy4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogVmluY2Vu
dCBQZWxsZXRpZXIgPHBsci52aW5jZW50QGdtYWlsLmNvbT4gIAo+IAo+IHdoZW4gc2VuZGluZyBh
IHBhdGNoIHNlcmllcyB3aXRoICJnaXQgZm9ybWF0LXBhdGNoIC02IiBhbmQgZnJpZW5kcyB3aWxs
Cj4gYXV0b21jYXRpY2FsbHkgZ2VuZXJhdGUgeC95IGFkZGl0aW9ucyBsaWtlICJbUEFUQ0ggMS82
XSIgYW5kIHNvIG9uLgo+IAo+IFBsZWFzZSB0cnkgdG8ga2VlcCB0aGVtIGFyb3VuZCB3aGVuIHNl
bmRpbmcsIGFzIGF1dG9tYXRlZCB0b29scyBmb3IgcGF0Y2gKPiBoYW5kbGluZyBsaWtlICJiNCIs
IHN0dW1ibGUgd2hlbiB0aGV5IGVuY291bnRlciBhIHBhdGNoIHNlcmllcyB3aXRob3V0IHRoZW0u
CgpBY3R1YWxseSBteSBpbnRlbnQgd2FzIHRvIG5vdCBtYWtlIHRoaXMgYSBzZXJpZXMsIGFzIGlu
IG15IHVuZGVyc3RhbmRpbmcKaW5kZXBlbmRlbnQgcGF0Y2hlcyBzaG91bGQvbWF5IGJlIHN1Ym1p
dHRlZCBzZXBhcmF0ZWx5IGZyb20gZWFjaCBvdGhlci4KVGhleSBqdXN0IGhhcHBlbiB0byBiZSBz
dGFja2VkLCBhbmQgaW4gdGhpcyBvcmRlciwgaW4gbXkgd29ya2luZyBjb3B5LApidXQgc2hvdWxk
IG5vdCBmdW5jdGlvbmFsbHkgaGF2ZSBhbnkgZGVwZW5kZW5jeSBvbiBvbmUgYW5vdGhlciAoSQpi
ZWxpZXZlIHRoZXkgc2hvdWxkIGV2ZW4gYXBwbHkgY2xlYW5seSBpbiBhbnkgb3JkZXIpLgoKSXQg
aXMgb25seSBhZnRlciBzZW5kaW5nIHRoYXQgSSByZWFsaXNlZCB0aGF0CiAgZ2l0IHNlbmQtZW1h
aWwgLS1uby10aHJlYWQgWy4uLl0gdjUuMTYtcmMxLi5yaXNjdl9mb3JfdXBzdHJlYW0Kc3RpbGwg
ZGVjaWRlZCB0byB0aHJlYWQgdGhlIGVtYWlscy4uLgpXaGljaCBpbmRlZWQgbWFrZXMgbXkgdXNl
IG9mICItLW5vLW51bWJlcmVkIiBhIG1pc3Rha2UuIFNvcnJ5IGZvciBub3QKY2hlY2tpbmcgLS1k
cnktcnVuIG91dHB1dCBtb3JlIGNsb3NlbHkuCgo+IEluIHRoaXMgY2FzZSBhCj4gCj4gCWI0IGFt
IGY2NTEyY2M1MGRjMzFhMDg2ZTAwZWQ1OWM2M2VhNjBkOGMxNDhmYzQuMTYzNzAyMzk4MC5naXQu
cGxyLnZpbmNlbnRAZ21haWwuY29tCj4gCj4gW2ZpcnN0IHBhdGNoIGluIHRoZSBzZXJpZXNdCj4g
d2lsbCBhY3R1YWxseSBvbmx5IHJldHJpZXZlIHRoZSBsYXN0IHBhdGNoCj4gCj4gCSJbUEFUQ0hd
IHJpc2N2OiBkdHM6IHNpZml2ZSB1bm1hdGNoZWQ6IExpbmsgdGhlIHRtcDQ1MSB3aXRoIGl0cyBw
b3dlciBzdXBwbHkuIgo+IAo+IGFzIGl0IHRoaW5rcyBpdCdzIGEgbmV3IHZlcnNpb24gb2YgdGhl
IGZpcnN0IG9uZS4KPiAKPiAKPiBUaGFua3MKPiBIZWlrbwo+IAo+ID4gLS0tCj4gPiAgYXJjaC9y
aXNjdi9ib290L2R0cy9zaWZpdmUvaGlmaXZlLXVubWF0Y2hlZC1hMDAuZHRzIHwgNCArKysrCj4g
PiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEv
YXJjaC9yaXNjdi9ib290L2R0cy9zaWZpdmUvaGlmaXZlLXVubWF0Y2hlZC1hMDAuZHRzIGIvYXJj
aC9yaXNjdi9ib290L2R0cy9zaWZpdmUvaGlmaXZlLXVubWF0Y2hlZC1hMDAuZHRzCj4gPiBpbmRl
eCA0ZjY2OTE5MjE1ZjYuLjMwNWEwODZlNTIwNyAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3Yv
Ym9vdC9kdHMvc2lmaXZlL2hpZml2ZS11bm1hdGNoZWQtYTAwLmR0cwo+ID4gKysrIGIvYXJjaC9y
aXNjdi9ib290L2R0cy9zaWZpdmUvaGlmaXZlLXVubWF0Y2hlZC1hMDAuZHRzCj4gPiBAQCAtMjQ1
LDQgKzI0NSw4IEBAICZwd20xIHsKPiA+ICAKPiA+ICAmZ3BpbyB7Cj4gPiAgCXN0YXR1cyA9ICJv
a2F5IjsKPiA+ICsJZ3Bpby1saW5lLW5hbWVzID0gIkoyOS4xIiwgIlBNSUNOVEIiLCAiUE1JQ1NI
RE4iLCAiSjguMSIsICJKOC4zIiwKPiA+ICsJCSJQQ0llX1BXUkVOIiwgIlRIRVJNIiwgIlVCUkRH
X1JTVE4iLCAiUENJZV9QRVJTVE4iLAo+ID4gKwkJIlVMUElfUlNUTiIsICJKOC4yIiwgIlVIVUJf
UlNUTiIsICJHRU1HWExfUlNUIiwgIko4LjQiLAo+ID4gKwkJIkVOX1ZERF9TRCIsICJTRF9DRCI7
Cj4gPiAgfTsKPiA+ICAgCj4gCj4gCj4gCj4gCgoKCgotLSAKVmluY2VudCBQZWxsZXRpZXIKR1BH
IGZpbmdlcnByaW50IDk4M0EgRThCNyAzQjkxIDE1OTggN0E5MiAzODQ1IENBQzkgMzY5MSA0MjU3
IEIwQzEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
