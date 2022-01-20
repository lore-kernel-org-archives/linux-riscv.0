Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CDCAC433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jan 2022 19:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=Qj6k5c7tvHM+cZZp/HpVB1wJ3MD8l7oH2JzTlmSd6E4=; b=pIYAxKmjp3vCesvi9LEuizTmtA
	t0R2hf+uc2OySTe3KzQl7VPhV+V9De0Bd+XCownrIXWoHNYViWdgPgQ/WUqGFuUgo+z/Gx7JRHHBq
	1SLXXSGywSyn+81eGKwEhgW030CX6QBp6DEy13jamWgVQ2irexiigq8PX6v3e+CUBOOW2+0BOZZ9N
	lD0LGzMc294dTzlaO/OykMByXj7xFvunbsvN/xbvGel6pcrho1+Hpjc4kQelvkXrBb9IFfgnXc0q7
	+2/YNZktw0SLJLEhC59MOb2Phw2o0gXL9c0C8yTBcOBrY6j3iE+OVAhtjd5B7V0GlEETuT0JYFiPq
	Ci1lUORQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAclj-00CvFY-Q0; Thu, 20 Jan 2022 19:06:47 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAclg-00CvF4-CQ
 for linux-riscv@lists.infradead.org; Thu, 20 Jan 2022 19:06:46 +0000
Received: by mail-pj1-x1034.google.com with SMTP id h12so6817706pjq.3
 for <linux-riscv@lists.infradead.org>; Thu, 20 Jan 2022 11:06:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=A96c3gu/cYOUmAtTJxNYWZVHkqwAqmvYJIDOnli7UuU=;
 b=z/6TUsx+MJEI1krGEmuIhdfv4P7ur1BeMSCr8OR0/Ptfsb8HFntDTRIzIYPLtou/rP
 F+BxdWjrSSil61UcggBCtxYw5NNNioDevlN8BNdRndijtbZqz8OlKWPMfA0SJcKq0A3V
 eTKNpGaO+CnDpVv5TxwK3KPbjI0FhNFNHhRRKAQ468gdDuxaa5jYfMykHSozXrAIpfw1
 fixZRnZhlVT8Ls1tHmiXJ1vU9Jwm4k5XfrXTEBSUggJoDxxrW0JYEnBfWrNMv4mc6VHi
 qxZp8Clblj/ldiJo/gEKax2zZf5yYnQtyaHMC22LiZG5A+wqGZS07Fc0KDh1atgWtD+y
 sRXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=A96c3gu/cYOUmAtTJxNYWZVHkqwAqmvYJIDOnli7UuU=;
 b=qAggLDHBYB0K3MUkRZcTa7paPUdXaGRXiK/KOKOP2eZki3EkoUIYtOPgZ3T9CjohnU
 0lRFr1Lku8tLc9foLgCfvQfpZ1hrifP1YwIM0K09p3Eu2Ed/k9Ntqejd+1nwLgrJDgUp
 woGl0hjHwpa+zWZjX4Po5uSjbXULiVvaeYeOe2tQ1BCAo8B0zRrpQSUNLH/mP4/xyOhw
 fWklEPwsLa447ciYvoQRhFDiTX8Frt0qi49OOUsn9BcFZIqcYyNjAIpnVH/KqxBZ6Ays
 D61777I8nuYvWa38AMdlo8InIqzKjCVsQTcAChkdEt9K+zcy3BL4dkFgmC4sRhcOuOK/
 IHjw==
X-Gm-Message-State: AOAM530NaEIZcPQbpikIT49797jwVaf4S3o/QDIDZou84ritn3WFKmqc
 vzS7dcQkZjFe9uKQnJiA1OJW5Q==
X-Google-Smtp-Source: ABdhPJyhO/g7aC+Jm/uza5IDS5TSEIQ7uHO/mefpVfU0eL7pkHDH0KlEEqZCHMU6oNBV0ECTXAH2XA==
X-Received: by 2002:a17:90a:8807:: with SMTP id
 s7mr417100pjn.223.1642705603752; 
 Thu, 20 Jan 2022 11:06:43 -0800 (PST)
Received: from localhost ([12.3.194.138])
 by smtp.gmail.com with ESMTPSA id a16sm4156485pfv.97.2022.01.20.11.06.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 11:06:43 -0800 (PST)
Date: Thu, 20 Jan 2022 11:06:43 -0800 (PST)
X-Google-Original-Date: Thu, 20 Jan 2022 11:06:14 PST (-0800)
Subject: Re: [PATCH 1/1] RISC-V: Change signature header field to use `.ascii`
 instead of opcode
In-Reply-To: <CAOnJCULOcquctjkYoxFSTaBVhRR=FN10OhKzvaXaEOx7V17=5g@mail.gmail.com>
CC: jrtc27@jrtc27.com, florian.wagner@nextsilicon.com,
 Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, yaron.dinkin@nextsilicon.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: florian.wagner@nextsilicon.com, atishp@atishpatra.org
Message-ID: <mhng-660c89c3-0a34-4f52-95d3-c7c39d1fad28@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220120_110644_453662_64F39047 
X-CRM114-Status: GOOD (  25.11  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gTW9uLCAxNyBKYW4gMjAyMiAxNzoyNTo0MCBQU1QgKC0wODAwKSwgYXRpc2hwQGF0aXNocGF0
cmEub3JnIHdyb3RlOgo+IE9uIE1vbiwgSmFuIDE3LCAyMDIyIGF0IDExOjAwIEFNIEplc3NpY2Eg
Q2xhcmtlIDxqcnRjMjdAanJ0YzI3LmNvbT4gd3JvdGU6Cj4+Cj4+IE9uIDE3IEphbiAyMDIyLCBh
dCAxNzozOSwgRmxvcmlhbiBXYWduZXIgPGZsb3JpYW4ud2FnbmVyQG5leHRzaWxpY29uLmNvbT4g
d3JvdGU6Cj4+ID4KPj4gPiBUaGUgYE1aYCBpbiB0aGUgc2lnbmF0dXJlIGhlYWRlciBmaWVsZCBp
cyBub3cgZW5jb2RlZCB2aWEgYC5hc2NpaWAgdG8gbWFrZQo+PiA+IHRoZSBrZXJuZWwgY29tcGls
ZSB3aXRob3V0IHRoZSBgY2AgZXh0ZW5zaW9uLgo+PiA+Cj4+ID4gU2lnbmVkLW9mZi1ieTogRmxv
cmlhbiBXYWduZXIgPGZsb3JpYW4ud2FnbmVyQG5leHRzaWxpY29uLmNvbT4KPj4gPiBTaWduZWQt
b2ZmLWJ5OiBZYXJvbiBEaW5raW4gPHlhcm9uLmRpbmtpbkBuZXh0c2lsaWNvbi5jb20+Cj4+ID4g
LS0tCj4+ID4gYXJjaC9yaXNjdi9rZXJuZWwvaGVhZC5TIHwgMiArLQo+PiA+IDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+PiA+Cj4+ID4gZGlmZiAtLWdpdCBh
L2FyY2gvcmlzY3Yva2VybmVsL2hlYWQuUyBiL2FyY2gvcmlzY3Yva2VybmVsL2hlYWQuUwo+PiA+
IGluZGV4IGY1MmYwMWVjYmVlYS4uOTMxYjYzNDY0YjkwIDEwMDY0NAo+PiA+IC0tLSBhL2FyY2gv
cmlzY3Yva2VybmVsL2hlYWQuUwo+PiA+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL2hlYWQuUwo+
PiA+IEBAIC00OCw3ICs0OCw3IEBAIEVOVFJZKF9zdGFydCkKPj4gPiAgICAgICAvKgo+PiA+ICAg
ICAgICAqIFRoaXMgaW5zdHJ1Y3Rpb24gZGVjb2RlcyB0byAiTVoiIEFTQ0lJIHJlcXVpcmVkIGJ5
IFVFRkkuCj4+ID4gICAgICAgICovCj4+ID4gLSAgICAgYy5saSBzNCwtMTMKPj4gPiArICAgICAu
YXNjaWkgIk1aIgo+PiA+ICAgICAgIGogX3N0YXJ0X2tlcm5lbAo+Pgo+PiBDT05GSUdfRUZJIGhh
cyBzZWxlY3QgUklTQ1ZfSVNBX0MsIHNvIHRoaXMgZG9lc27igJl0IHNlZW0gdG8gYWNoaWV2ZQo+
PiBhbnl0aGluZz8gSWYgeW91IHRoZW4gcmVtb3ZlIHRoYXQgc2VsZWN0LCB3ZWxsLCB5b3UgZ2V0
IGFuIEVGSSBiaW5hcnkKPj4gdGhhdCB3b3JrcywgYnV0IGlmIHlvdSBqdW1wIHRvIGl0IGRpcmVj
dGx5IGFzIGEgbm9uLUVGSSBiaW5hcnkgdGhlbgo+PiB5b3XigJlsbCB0cmFwIG9uIGEgbm9uLVJW
QyBzeXN0ZW0gYXMgdGhhdCB3b27igJl0IGJlIGEgdmFsaWQgaW5zdHJ1Y3Rpb24uCj4+IFNvIEkg
dGhpbmsgdGhpcyBuZWVkcyBtb3JlIGV4cGxhbmF0aW9uIGFuZCBkaXNjdXNzaW9uLgo+Pgo+Cj4g
SGVyZSBpcyB0aGUgcHJldmlvdXMgZGlzY3Vzc2lvbiByZWdhcmRpbmcgdGhpcy4KPgo+IGh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL3BpcGVybWFpbC9saW51eC1yaXNjdi8yMDIxLU1hcmNoLzAw
NDk5OC5odG1sCj4KPiBUTERSLCB0aGVyZSBpcyBubyBjbGVhbmVyIHdheSB0byBzdXBwb3J0IGJv
dGggRUZJICYgbm9uLVVFRkkgYm9vdGluZwo+IG9uIGEgcGxhdGZvcm0KPiB3aXRob3V0IEMgZXh0
ZW5zaW9uLiBMaW51eCBrZXJuZWwgYW55d2F5cyByZWNvbW1lbmQgcnY2NGdjIGZvciBwbGF0Zm9y
bXMuCgpZZXAsIHRob3VnaCBpZiB0aGVyZSdzIGEgdXNlIGNhc2UgZm9yIHllcy1FRkksIG5vLUMg
dGhlbiB3ZSBjb3VsZCBhbHdheXMgCmFsbG93IHVzZXJzIHRvIGJ1aWxkIEVGSS1vbmx5IGtlcm5l
bHMgKGFzIHBvaW50ZWQgb3V0IGluIHRoZSB0aHJlYWQpLiAgCklzIHRoZXJlIGhhcmR3YXJlIHRo
YXQgYWN0dWFsbHkgZG9lcyB0aGF0PwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
