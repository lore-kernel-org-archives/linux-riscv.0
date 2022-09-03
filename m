Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D114EECAAD4
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Sep 2022 20:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4TJ/EjpF+fE8TzBKD7fGe/lHeQ3jIOPzphjNodzHv40=; b=sTAHXyWqPjS9QA
	RoblWu/MQBaz7xvz9hC6inm4tjgYxeb0TQoLDDLZmVWUKaYOJxQJJzjvD7M5Q9ON9JZieon074mbK
	8d7Kow4+KDcW91gFS7NJLaRdFvsf9rXELkFmdxhWFXDLXLQ8QNxQYxgs5U6WXYkHRLPXR3fIosyDP
	yzYW5aHbFWaOvQHM0R52ececdGI1t48XNuBFM6NSlRdZvJz4EwlceZUQxO570ePnX96nJNbEw1xeI
	EUJMG23UklTLY7wYiYuIklJnj11GcEtTqdmAAZZ1TckhLrmCGi7IXfsKLqYLk8kV97DYFmI7zxFpL
	FRLvjBILt2lO2Xy93Tcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oUZYz-002f3M-OO; Sat, 03 Sep 2022 20:16:21 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oUZYw-002ezY-W4
	for linux-riscv@lists.infradead.org; Sat, 03 Sep 2022 20:16:20 +0000
Received: by mail-wr1-x436.google.com with SMTP id v16so6399396wrm.8
        for <linux-riscv@lists.infradead.org>; Sat, 03 Sep 2022 13:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date;
        bh=2R5mh9Ozb9ba399KwnKZOzn+X6wlKvntyBRFlq3SO5c=;
        b=JvRjTgMbs1qKCkRnEfHuGlI/YSfYZGAtjy1JGnr8ClfXTswk2haGiwHiKwObIAlcvV
         lqgkTjERydzk+8JBeLlPjpy3u7qwBlChdyqJpaecbzzT/oP6f5OJjjuNrc9BSQBpovIi
         Xcrp74zkZdw/qEtE1WY/Cgt6y6RBiSJuOlUzdtxdMXQytkdLzEoTVgZM6mXaSxOG4MEq
         PLs88oxO38o0sCdB9FOWvSlaBZkkiJXP/jdF+cbQnJOAr3c1eXgK2tirJ9fG31mI3nMW
         H0L0YvWjrq5uyroSl2CrLsH3TgaOkXrh4npHqCbRbc5vZ/mYccNsfA0RJ4FfRfxnXGql
         S48g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=2R5mh9Ozb9ba399KwnKZOzn+X6wlKvntyBRFlq3SO5c=;
        b=VfteTYv5E3amYa2EL/SSUE6TqBbpxTyLUk+8gImMjhavRLPfesgvlETjp6oJJPIC6E
         CvRjFdsg/5gQGkwa/6BnadjXpSHQMDEI+q5OikOQUARZx3ZOk410rsNI7RPk5la2HhPx
         fZ5ODzkH0idpDYETuD1yO/jkoT592Bxk4IsYuPlJr6PQhU9bb83AIj9p2Jl/9GO/C1bx
         nQd25sliBfNJ0tBcPbbMp9nQ71/lVfH0P57kODzMh9H4FsLSi85QSNwXtiDhOQtJjRCR
         uA/0l2AiOPEJbteY92aKpys6xoW1bvPvfi881LL5RxYgCo5Wb4o6AXDBMmaOyC359Aok
         GlYQ==
X-Gm-Message-State: ACgBeo1VHsShH+DCcB7kwZEHS+ZfOpGygexq2UWv31CnX56A9rAO3Ede
	R72rrZHYNKdYdMpI5eyDeosXKA==
X-Google-Smtp-Source: AA6agR6AsmigZ6KGU6X7Fx32yjzUCRSrAnkeu5s8/FBlY3CCdNJaTlUI8QJzTLyXXIiJzzZmbczaQg==
X-Received: by 2002:a5d:64a8:0:b0:226:f3f3:9914 with SMTP id m8-20020a5d64a8000000b00226f3f39914mr7890497wrp.343.1662236176186;
        Sat, 03 Sep 2022 13:16:16 -0700 (PDT)
Received: from smtpclient.apple (global-5-141.n-2.net.cam.ac.uk. [131.111.5.141])
        by smtp.gmail.com with ESMTPSA id y22-20020a7bcd96000000b003a54f1d007csm5923534wmj.10.2022.09.03.13.16.14
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 03 Sep 2022 13:16:15 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Subject: Re: [PATCH v9 1/7] RISC-V: Clear SIP bit only when using SBI IPI
 operations
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <20220903161309.32848-2-apatel@ventanamicro.com>
Date: Sat, 3 Sep 2022 21:16:14 +0100
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Marc Zyngier <maz@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Atish Patra <atishp@atishpatra.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Anup Patel <anup@brainfault.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 linux-kernel@vger.kernel.org,
 Bin Meng <bmeng.cn@gmail.com>
Message-Id: <6ABE254E-C7DA-468B-9A6B-D10FF32E0E89@jrtc27.com>
References: <20220903161309.32848-1-apatel@ventanamicro.com>
 <20220903161309.32848-2-apatel@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
X-Mailer: Apple Mail (2.3696.80.82.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220903_131619_081727_A96ADAC7 
X-CRM114-Status: GOOD (  22.40  )
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

XU9uIDMgU2VwdCAyMDIyLCBhdCAxNzoxMywgQW51cCBQYXRlbCA8YXBhdGVsQHZlbnRhbmFtaWNy
by5jb20+IHdyb3RlOgo+IAo+IFRoZSBzb2Z0d2FyZSBpbnRlcnJ1cHQgcGVuZGluZyAoaS5lLiBb
TXxTXVNJUCkgYml0IGlzIHdyaXRlYWJsZSBmb3IKPiBTLW1vZGUgYnV0IHJlYWQtb25seSBmb3Ig
TS1tb2RlIHNvIHdlIGNsZWFyIHRoaXMgYml0IG9ubHkgd2hlbiB1c2luZwo+IFNCSSBJUEkgb3Bl
cmF0aW9ucy4KClVoLCB3aGVyZSBpcyB0aGlzIHNwZWNpZmllZD8gSSBkb27igJl0IHNlZSB0aGF0
LCBhbmQgdGhhdCB3b3VsZCBiZSBvZGQuClRoZSBzcGVjIGNsZWFybHkgc2F5cyB0aGF0IGlmIHN1
cGVydmlzb3Igc29mdHdhcmUgaW50ZXJydXB0cyBhcmUKaW1wbGVtZW50ZWQgdGhlbiB0aGUgYml0
IGlzIHdyaXRlYWJsZSwgd2l0aCBubyBjYXZlYXRzIG9uIHdoZW4gKGJleW9uZAp0aGUgcGVybWlz
c2lvbnMgcmVxdWlyZWQgdG8gYWNjZXNzIHRoZSBDU1IgaW4gZ2VuZXJhbCkuCgpUaGlzIHBhdGNo
IGRvZXMgbWFrZSBzZW5zZSBmb3IgYSBkaWZmZXJlbnQgcmVhc29uIHRob3VnaDogdGhhdCBJUElz
IG1heQpub3QgYmUgdXNpbmcgc29mdHdhcmUgaW50ZXJydXB0cyBhdCBhbGwgKGluIHRoZSBJTVNJ
QyBjYXNlKS4KCkplc3MKCj4gU2lnbmVkLW9mZi1ieTogQW51cCBQYXRlbCA8YXBhdGVsQHZlbnRh
bmFtaWNyby5jb20+Cj4gUmV2aWV3ZWQtYnk6IEJpbiBNZW5nIDxibWVuZy5jbkBnbWFpbC5jb20+
Cj4gLS0tCj4gYXJjaC9yaXNjdi9rZXJuZWwvc2JpLmMgfCA4ICsrKysrKystCj4gYXJjaC9yaXNj
di9rZXJuZWwvc21wLmMgfCAyIC0tCj4gMiBmaWxlcyBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyks
IDMgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3NiaS5j
IGIvYXJjaC9yaXNjdi9rZXJuZWwvc2JpLmMKPiBpbmRleCA3NzVkMzMyMmI0MjIuLmZjNjE0NjUw
YTJlMyAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9zYmkuYwo+ICsrKyBiL2FyY2gv
cmlzY3Yva2VybmVsL3NiaS5jCj4gQEAgLTY0Myw4ICs2NDMsMTQgQEAgc3RhdGljIHZvaWQgc2Jp
X3NlbmRfY3B1bWFza19pcGkoY29uc3Qgc3RydWN0IGNwdW1hc2sgKnRhcmdldCkKPiAJc2JpX3Nl
bmRfaXBpKHRhcmdldCk7Cj4gfQo+IAo+ICtzdGF0aWMgdm9pZCBzYmlfaXBpX2NsZWFyKHZvaWQp
Cj4gK3sKPiArCWNzcl9jbGVhcihDU1JfSVAsIElFX1NJRSk7Cj4gK30KPiArCj4gc3RhdGljIGNv
bnN0IHN0cnVjdCByaXNjdl9pcGlfb3BzIHNiaV9pcGlfb3BzID0gewo+IC0JLmlwaV9pbmplY3Qg
PSBzYmlfc2VuZF9jcHVtYXNrX2lwaQo+ICsJLmlwaV9pbmplY3QgPSBzYmlfc2VuZF9jcHVtYXNr
X2lwaSwKPiArCS5pcGlfY2xlYXIgPSBzYmlfaXBpX2NsZWFyCj4gfTsKPiAKPiB2b2lkIF9faW5p
dCBzYmlfaW5pdCh2b2lkKQo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9zbXAuYyBi
L2FyY2gvcmlzY3Yva2VybmVsL3NtcC5jCj4gaW5kZXggNzYwYTY0NTE4YzU4Li5jNTZkNjdmNTNl
YTkgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvc21wLmMKPiArKysgYi9hcmNoL3Jp
c2N2L2tlcm5lbC9zbXAuYwo+IEBAIC04Myw4ICs4Myw2IEBAIHZvaWQgcmlzY3ZfY2xlYXJfaXBp
KHZvaWQpCj4gewo+IAlpZiAoaXBpX29wcyAmJiBpcGlfb3BzLT5pcGlfY2xlYXIpCj4gCQlpcGlf
b3BzLT5pcGlfY2xlYXIoKTsKPiAtCj4gLQljc3JfY2xlYXIoQ1NSX0lQLCBJRV9TSUUpOwo+IH0K
PiBFWFBPUlRfU1lNQk9MX0dQTChyaXNjdl9jbGVhcl9pcGkpOwo+IAo+IC0tIAo+IDIuMzQuMQo+
IAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4g
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
Zwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
