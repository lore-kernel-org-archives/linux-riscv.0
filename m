Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B1E3C001DB
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Aug 2023 01:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yLai1xrxOzPbyTT4jsHclPV4jQ4Zzn1bMXIjS98jDNE=; b=hDMgWtQ/noOkAs
	jTP5LuPTxKUwdfV8rHPwUnAyyoqk5ruYnBmCtYM27fco0YvuVmbR9sgfvb1cBcQILVfFf0RBLJYmf
	UH+mO54nywX2LUQZCnqsP63kN/V5HIpyObBk+kvpWGOqbImyWV046Tz3W0tzZRBICKuntNfYPMYt7
	B4asCvuj3TVFZab9mZJYf2WytljH3inC0UvjXdwJjCCxi8iZ/KvdjEsD+GesbRRlZKvnxSqlBg8aB
	NJFwlxPxLpYgehA8+g4nBtvd1bVymSCodd6EivSm7nt1cX2GuULjabeX9wvYtB0MfqAs8e9vWg4jN
	Fu6h4nS1xqBUXxobOjTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRjpg-00BH0A-0u;
	Fri, 04 Aug 2023 01:42:24 +0000
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRjpd-00BGyO-0h
	for linux-riscv@lists.infradead.org;
	Fri, 04 Aug 2023 01:42:23 +0000
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-583f99641adso17656787b3.2
        for <linux-riscv@lists.infradead.org>; Thu, 03 Aug 2023 18:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1691113338; x=1691718138;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=giD5crJvVgFXxEOjUQ9Yq0Y5c2PK/y9XDLcfiurNQEY=;
        b=bbPLdps+zGZvnWfC0ij+NMQEfOt2gNinAPJJZiO8Yzi1j5Ys7cz6KVf+cUn2GQlk0B
         Eu7JkLy7WinuqqUb1Y3C4Ixg1DqX0pjHxLsthYxkM6N9hS/+u2Hav/Ox+44DG7ZkUGMR
         x+C0nTaQtLMMnAMMQHlPvDdDdd6DDiuaNljvwRktma/vRkilHtbuMHq/qiNstSGMEWD3
         1DxfBKwQSWt47850VXbktJMzOFBicXid6NjUyeplXK0+JMPJwGIRu5s1PFzzwPGwNuoo
         oD2DUYJabV+jVXI7kZnoxVQxfJdIOfUN2VvkXtiFYuXvmbgwqV+aO/1qhRJqLu3hs0ih
         TEEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691113338; x=1691718138;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=giD5crJvVgFXxEOjUQ9Yq0Y5c2PK/y9XDLcfiurNQEY=;
        b=lN9GWnxetpTXaJw5c1PlSjTXl9fUFlQTp2LyEWrXzRCWSZyYLIfXO2b7C3k1Bcw05p
         LQGPMYlRADZ5SsOLrHhkG95QwjZAfG9+4qOikXnP6/V4xuE0mYZpLMObE+jW9fMfxcFZ
         WlM/qJeBSI6UvrlrUwxcdv15ok7wORJK2GWXDxcWcjRCBmX4vnnSUwscY8e9f/mAKU0V
         PeYOVMZndIHDMDhFrZ6sv33uUmhVvjSvTTM3Vhvjh9JWqTa8Fa8FBy5gnrVYlrZlt77G
         ZGvWV/KWDXDmw0T2bJOw5AcfwXw+3iS+HMdv6pbhUtT7+n57pnAkzIFhMfY/F5NlUcYE
         6UIw==
X-Gm-Message-State: AOJu0YyGBJPdhFl65myRPRRQWsw8/qS4s3XWEmpGFlYuJH+7/tzd3uJr
	ZPXa2f6DErDDcRuMwW9Y4AxMGaOFtfLe5D/SOYvAfzXYaV6sufu//Xg=
X-Google-Smtp-Source: AGHT+IE2GOuOWOrI3eLUWlcZE1w35uJr5Ss1GfYBoSJYqAQUdRHIocBAQZMyVMKMIgPWxo+ZI3IaojEWNQmnAmBj/Sw=
X-Received: by 2002:a81:a545:0:b0:577:3eaa:8d97 with SMTP id
 v5-20020a81a545000000b005773eaa8d97mr281414ywg.17.1691113338123; Thu, 03 Aug
 2023 18:42:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230803085734.340-1-nylon.chen@sifive.com> <20230803-vehicular-leggings-2830239f818a@wendy>
 <20230803-caretaker-voicing-e982f2334067@wendy>
In-Reply-To: <20230803-caretaker-voicing-e982f2334067@wendy>
From: Nylon Chen <nylon.chen@sifive.com>
Date: Fri, 4 Aug 2023 09:42:06 +0800
Message-ID: <CAHh=Yk9A3MP4Zgz53+s_ugvMtnv57igY=+Yccbp9Om9jBuxXqg@mail.gmail.com>
Subject: Re: [PATCH v4 0/1] Change PWM-controlled LED pin active mode and algorithm
To: Conor Dooley <conor.dooley@microchip.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, geert+renesas@glider.be, pavel@ucw.cz, 
	vincent.chen@sifive.com, emil.renner.berthing@canonical.com, 
	aou@eecs.berkeley.edu, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org, conor@kernel.org, 
	zong.li@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_184221_339050_4B54CBB6 
X-CRM114-Status: GOOD (  27.62  )
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

SGkgQ29ub3IsCgpDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPiDmlrwg
MjAyM+W5tDjmnIgz5pelIOmAseWbmyDkuIvljYg1OjQ05a+r6YGT77yaCj4KPiBIZXkgTnlsb24s
Cj4KPiAoSSB5b2lua2VkIHRoZSByZXBseSB0byAxLzEgdG8gaGVyZSwgYXMgaXQgbWFrZXMgbW9y
ZSBzZW5zZSBpbiB0aGlzCj4gY29udGV4dCkKPgo+ID4gT24gVGh1LCBBdWcgMDMsIDIwMjMgYXQg
MTA6MTU6MTBBTSArMDEwMCwgQ29ub3IgRG9vbGV5IHdyb3RlOgo+ID4gPiBPbiBUaHUsIEF1ZyAw
MywgMjAyMyBhdCAwNDo1NzozM1BNICswODAwLCBOeWxvbiBDaGVuIHdyb3RlOgo+ID4gPiA+IEFj
Y29yZGluZyB0byB0aGUgY2lyY3VpdCBkaWFncmFtIG9mIFVzZXIgTEVEcyAtIFJHQiBkZXNjcmli
ZWQgaW4gdGhlbWFudWFsIGhpZml2ZS11bmxlYXNoZWQtYTAwLnBkZlswXSBhbmQgaGlmaXZlLXVu
bWF0Y2hlZC1zY2hlbWF0aWNzLXYzLnBkZlsxXS4KPiA+ID4gPgo+ID4gPiA+IFRoZSBiZWhhdmlv
ciBvZiBQV00gaXMgYWNpdHZlLWhpZ2guCj4gPiA+ID4KPiA+ID4gPiBSZW1vdmVkIHBhdGNoZXM6
IDEKPiA+ID4gPiBOZXcgcGF0Y2hlczogKG5vbmUpCj4gPiA+ID4KPiA+ID4gPiBMaW5rczoKPiA+
ID4gPiAtIFswXTogIGh0dHBzOi8vc2lmaXZlLmNkbi5wcmlzbWljLmlvL3NpZml2ZS9jNTJhOGUz
Mi0wNWNlLTRhYWYtOTVjOC03YmY4NDUzZjg2OThfaGlmaXZlLXVubGVhc2hlZC1hMDAtc2NoZW1h
dGljcy0xLnBkZgo+ID4gPiA+IC0gWzFdOiAgaHR0cHM6Ly9zaWZpdmUuY2RuLnByaXNtaWMuaW8v
c2lmaXZlLzZhMDZkNmMwLTZlNjYtNDliNS04ZTllLWU2OGNlNzZmNDE5Ml9oaWZpdmUtdW5tYXRj
aGVkLXNjaGVtYXRpY3MtdjMucGRmCj4gPiA+ID4gLSBbMl06ICBodHRwczovL3NpZml2ZS5jZG4u
cHJpc21pYy5pby9zaWZpdmUvMWE4MmU2MDAtMWY5My00ZjQxLWIyZDgtODZlZDhiMTZhY2JhX2Z1
NzQwLWMwMDAtbWFudWFsLXYxcDYucGRmCj4gPiA+ID4KPiA+ID4gPiBDaGFuZ2VkIGluIHY0Ogo+
ID4gPiA+ICAtIFJlbW92ZSBwcmV2aW91cyB1cGRhdGVzIHRvIHRoZSBQV00gYWxnb3JpdGhtLgo+
ID4gPgo+ID4gPiBXaHk/IEkgZG9uJ3QgcmVjYWxsIHRoZSBjb25jbHVzaW9uIG9uIHRoZSBwcmV2
aW91cyB2ZXJzaW9uIGJlaW5nIHRoYXQKPiA+ID4gdGhhdCBwYXRjaCB3YXMgbm90IG5lZWRlZC4K
PiA+Cj4gPiBJIGFwb2xvZ2l6ZSBmb3IgZm9yZ2V0dGluZyBhYm91dCB0aGlzIHVwZGF0ZSBlYXJs
aWVyLiBKdXN0IG5vdywKPiA+IEkgdHJpZWQgdG8gcHVsbCByZWJhc2UgbWFzdGVyIGFuZCBub3Rp
Y2VkIHRoYXQgb3RoZXIgZGV2ZWxvcGVycyBzZWVtCj4gPiB0byBoYXZlIG1hZGUgc29tZSBmaXhl
cyB0byB0aGUgYWxnb3JpdGhtLiBVcG9uIGNsb3NlciBpbnNwZWN0aW9uLCBJCj4gPiBmb3VuZCB0
aGF0IHRoZXkgYWRkcmVzc2VkIHRoZSBwYXJ0IHdlIHByZXZpb3VzbHkgZGlzY3Vzc2VkIHdpdGgg
RW1pbAo+ID4gYW5kIFV3ZSwgc3VjaCBhcyAiZmlyc3QgcHdtX2FwcGx5X3N0YXRlLiIKPiA+Cj4g
PiBUaGVyZWZvcmUsIG15IGluc3RpbmN0IHRlbGxzIG1lIHRoYXQgdGhleSBoYXZlIGFscmVhZHkg
dGFrZW4gY2FyZSBvZgo+ID4gdGhlIGlzc3VlcyB3ZSBkaXNjdXNzZWQgYmVmb3JlLgo+Cj4gSSBk
aWRuJ3Qgc2VlIGFueXRoaW5nIGluIGxpbnV4LW5leHQgdGhhdCB3b3VsZCBzb2x2ZSB0aGlzIHBy
b2JsZW0gb2YKPiBpbnZlcnNpb24uIFRoZSBsYXN0IG1lYW5pbmdmdWwgY2hhbmdlIGlzOgo+ICAg
ICAgICAgY29tbWl0IDMzNGM3YjEzZDM4MzIxZTQ3ZDFhNTFkYmEwYmVmOWY0YzQwM2VjNzUKPiAg
ICAgICAgIEF1dGhvcjogICAgIEVtaWwgUmVubmVyIEJlcnRoaW5nIDxlbWlsLnJlbm5lci5iZXJ0
aGluZ0BjYW5vbmljYWwuY29tPgo+ICAgICAgICAgQXV0aG9yRGF0ZTogV2VkIE5vdiA5IDEyOjM3
OjI0IDIwMjIgKzAxMDAKPiAgICAgICAgIENvbW1pdDogICAgIFRoaWVycnkgUmVkaW5nIDx0aGll
cnJ5LnJlZGluZ0BnbWFpbC5jb20+Cj4gICAgICAgICBDb21taXREYXRlOiBNb24gSmFuIDMwIDE2
OjQyOjQ1IDIwMjMgKzAxMDAKPgo+ICAgICAgICAgICAgIHB3bTogc2lmaXZlOiBBbHdheXMgbGV0
IHRoZSBmaXJzdCBwd21fYXBwbHlfc3RhdGUgc3VjY2VlZAo+Cj4gd2hpY2ggcHJlZGF0ZXMgeW91
ciB2MyBieSBxdWl0ZSBhIGJpdC4KPgo+ID4gSSB3aWxsIHJldmlldyB0aGUgY29uZmxpY3Rpbmcg
cGFydHMgaW4gdGhlIHB3bS1zaWZpdmUuYyBjb2RlIGluIG15IHY0Cj4gPiB2ZXJzaW9uIG9uY2Ug
YWdhaW4gdG8gZW5zdXJlIHRoZXJlIGFyZSBubyBvbWlzc2lvbnMuIElmIEkgZmluZCBhbnksIEkK
PiA+IHdpbGwgc3VibWl0IHY1IGFjY29yZGluZ2x5Lgo+Cj4gQW5kIGlmIHRoaXMgcGF0Y2ggaXMg
b2theSBpbiBpc29sYXRpb24sIHBsZWFzZSByZXBseSBoZXJlIGV4cGxhaW5pbmcKPiB3aGljaCBj
b21taXQgZml4ZWQgdGhlIGFsZ29yaXRobSwgc28gdGhhdCBJIGNhbiBwaWNrIGl0IHVwLgpUaGlz
IHBhdGNoIG5lZWRzIHRvIGJlIGFjY29tcGFuaWVkIGJ5IG1vZGlmaWNhdGlvbnMgdG8gdGhlCnB3
bV9zaWZpdmVfYXBwbHkoKSBmdW5jdGlvbiB0byBtYWtlIHNlbnNlLgoKSSB3aWxsIGRvdWJsZS1j
aGVjayBhbmQgcmV2aWV3IHRoZSBwcmV2aW91cyBkaXNjdXNzaW9ucyB0byBlbnN1cmUKdGhhdC4g
VGhhbmsgeW91IGZvciB5b3VyIHJlc3BvbnNlLgo+Cj4gVGhhbmtzLAo+IENvbm9yLgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
