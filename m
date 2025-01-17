Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35976C02183
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Jan 2025 23:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BvVwHFUZrjwbs40eYn6V+yJjQo5hzJlDFdNee644s4o=; b=3PfAjTOPddm9Ah
	LCvhbs+Pye6b9iJ86Cjir6Ny+zjcy+Hn6dSRwIxmgeS+w0xrEBRBPN974ljr27XOLtJB/KJay5JPB
	8fsgsWRlE6qdAnuvt+D2RMQ4U+fBDE4GsiHHv1ANPWpMzAGGx58Toje+mW+aVHIUb5lQufTkfVsCi
	qowS+67qvRsthBjWWp9j+Zn9LKF7sKvFOfXfg0hsHm045RBtIMjPFU03bEwOzyfCoEo00sFwPYtK4
	k1lk1zY5u4iOAbxFrv/1TfJUCEKgvJXgN8eaMn0dIPqcH7P046Xl6gLltYW4dwvP7ABCYRyuKco7r
	qaEkf1n2/lOoLW3l71Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYvrm-00000001Xu2-2V7d;
	Fri, 17 Jan 2025 23:35:06 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYvrk-00000001XtZ-0e6I
	for linux-riscv@lists.infradead.org;
	Fri, 17 Jan 2025 23:35:05 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4362bae4d7dso18159065e9.1
        for <linux-riscv@lists.infradead.org>; Fri, 17 Jan 2025 15:35:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user; t=1737156902; x=1737761702; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DZIxbrS+6qey/z1UtOsJVpy7C8TzQQiN8zkbmkVdXow=;
        b=fGrWd+I8qncuJONohkcTLaLQmHjrPOo0HlUy9v7LN1SbNLUhRHNjXixm7RQFthpjjC
         srKQq0LOhLgM4HNcX60ZtqDJy7bYOfTKFY5N/F8sGCL1Bg2DXJ+wp+i3LwRdyVVEvKJf
         EUSAxXpvVePy/3QsXxNWlYouhDubQUSx+WcaRWJ14LDu4CdQgZQ61fyrTm52fxlfxjk5
         uGbCxVVP2h4jKZ8jdiChN5kBDwZtXCOFEbQb2aLX3vTFMZWqmWnuYTqh75C7uF84/ruJ
         5spkrtdMa80kp/SQdYxN3dPU7wffIYMPE0k7wy6g3IFsnQzm2ZLX3TsiRE76uDnDQW67
         1Msw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737156902; x=1737761702;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DZIxbrS+6qey/z1UtOsJVpy7C8TzQQiN8zkbmkVdXow=;
        b=HTybzhjfDPh+fdn5evG2iDXOlZEeDisABe9bvnzeFVj6VuaooD0+MuRw14bkUHU85C
         hxFuHtmLH+uzdgo+sCvuID3H3o7rnQXAYPvRVYTTX0WTdouo0c9PvvTz8ksyeeYoht8x
         qIKrQi+0dbvZ8tEpClCQeT+rJVSp+er+LUu8W2M7ynNYmwtnaptQmQdoZsKlp1Tz82a6
         R/UtMX74vPR454mFlOo7j6mg54fy94wHTbgeHTFg3tj7nSha0PKB0Vi1EHtKHmMsWlfu
         3MIapTL/DTmiyoJNdbbrB2r4S1EZW5v3xk2Wafd1c7ysZ81j8FDD5vL2ZRB4XbDXlQNw
         uhUA==
X-Forwarded-Encrypted: i=1; AJvYcCVni4u7TmgJd0TyOoBaLjuQQGdI8v/IeFT8yeBlaSm4Qf1y7OMTCYk/5mvUb9PNRRBiNiq6saQGw+uDZg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzgZBlMjWUqZoA9qLKKLvkHP3XKrFU4VMhB8AKThwj+xluD4Sih
	nXbRUmgzQNc6ilF1VIkUqxKU4OQMHzwIgYQYjDAkueZXsyHO+nHtux/gSd+5Suo=
X-Gm-Gg: ASbGnculuJ0MqXS2rMyVCG/7RxJJTxTCGJe6yzDlAVDk4Uvk6X8GtzOTA2dwHokYfhj
	Pyb53rshqRGLX7CqDXBPDE7qfgOpoGRd/ZnQ48djRLFZphqgJhXmo+1Lw+xmaCU6MkSz7H7MpSB
	URMDCLza0kwQPUtBCQLnDl4dwQR+SgN6tyKnwSYst0FTgtygVCXmy6ypOfprczBUdU2Z390YkrW
	dfUicRX6Sg1EXGtxh0FkYXGDP3Bg9Rxv3tq7hdKGPbwO57navPuAVlkULtTDi0Wwh46xHD+mqEi
	PrXmzHA=
X-Google-Smtp-Source: AGHT+IHL/kbVkjsUk4WCxah47gIEMHWcizsQ61cqAdFwl9gUpU7S0773PSIifPIZ7uu+0q2tjVPbmw==
X-Received: by 2002:a5d:64a3:0:b0:38a:624b:d55e with SMTP id ffacd0b85a97d-38bf57a684fmr4371686f8f.41.1737156901871;
        Fri, 17 Jan 2025 15:35:01 -0800 (PST)
Received: from smtpclient.apple ([131.111.5.201])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf322ace8sm3691564f8f.53.2025.01.17.15.35.00
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 17 Jan 2025 15:35:01 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.300.87.4.3\))
Subject: Re: [PATCH v2 2/4] riscv: uaccess: use input constraints for ptr of
 __put_user
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <20241118230112.2872978-3-cyrilbur@tenstorrent.com>
Date: Fri, 17 Jan 2025 23:34:49 +0000
Cc: palmer@dabbelt.com,
 aou@eecs.berkeley.edu,
 paul.walmsley@sifive.com,
 linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Jisheng Zhang <jszhang@kernel.org>
Message-Id: <EA2CB85E-E210-402E-B891-2F4420E55CDB@jrtc27.com>
References: <20241118230112.2872978-1-cyrilbur@tenstorrent.com>
 <20241118230112.2872978-3-cyrilbur@tenstorrent.com>
To: Cyril Bur <cyrilbur@tenstorrent.com>
X-Mailer: Apple Mail (2.3826.300.87.4.3)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_153504_209718_421192F0 
X-CRM114-Status: GOOD (  17.52  )
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

T24gMTggTm92IDIwMjQsIGF0IDIzOjAxLCBDeXJpbCBCdXIgPGN5cmlsYnVyQHRlbnN0b3JyZW50
LmNvbT4gd3JvdGU6Cj4gCj4gRnJvbTogSmlzaGVuZyBaaGFuZyA8anN6aGFuZ0BrZXJuZWwub3Jn
Pgo+IAo+IEkgYmVsaWV2ZSB0aGUgb3V0cHV0IGNvbnN0cmFpbnRzICI9bSIgaXMgbm90IG5lY2Vz
c2FyeSwgYmVjYXVzZQo+IHRoZSBpbnN0cnVjdGlvbiBpdHNlbGYgaXMgIndyaXRlIiwgd2UgZG9u
J3QgbmVlZCB0aGUgY29tcGlsZXIKPiB0byAid3JpdGUiIGZvciB1cy4gU28gdGVsbCBjb21waWxl
ciB3ZSByZWFkIGZyb20gbWVtb3J5IGluc3RlYWQKPiBvZiB3cml0aW5nLgoKVGhhdOKAmXMgbm90
IHdoYXQgPW0gZG9lcy4gPW0gdGVsbHMgdGhlIGNvbXBpbGVyIOKAnHRoaXMgYXNzZW1ibHkgd2ls
bCBiZQp3cml0aW5nIHRvIHRoaXMgbWVtb3J5IGxvY2F0aW9uLCBhbmQgbmVlZHMgdGhlIGFkZHJl
c3Mgb2YgdGhlIGxvY2F0aW9uCmZvciB0aGF0IG9wZXJhbmTigJ0uIElmIHlvdSBtb3ZlIGl0IGZy
b20gYW4gb3V0cHV0IHRvIGFuIGlucHV0IHRoZW4geW91CmdldCB0aGUgc2FtZSBhc3NlbWJseSBn
ZW5lcmF0ZWQsIGJ1dCB0aGUgY29tcGlsZXIgYmVsaWV2ZXMgeW91IGFyZQoqcmVhZGluZyogZnJv
bSB0aGF0IG1lbW9yeSwgbm90ICp3cml0aW5nKiB0byBpdCwgYW5kIHNvIGRvZXMgbm90CmJlbGll
dmUgdGhlIG1lbW9yeSBtYXkgYmUgY2xvYmJlcmVkLgoKTm93LCBpdCBtYXkgd2VsbCBiZSB0aGF0
LCBieSB2aXJ0dWUgb2YgdGhpcyBiZWluZyB1c2Vyc3BhY2UgbWVtb3J5IHRoYXQKaXMgb25seSBl
dmVyIGFjY2Vzc2VkIHZpYSBhc3NlbWJseSwgYW5kIGFueSBpbmxpbmUgYXNzZW1ibHkgYmVpbmcK
bWFya2VkIHZvbGF0aWxlLCB0aGlzIGluIGVmZmVjdCBkb2VzbuKAmXQgbWF0dGVyLiBCdXQgaXQg
aXMgc3RpbGwKdGVjaG5pY2FsbHkgd3JvbmcgdG8gbW9kZWwgaXQgdGhhdCB3YXksIGFuZCB5b3Ug
Y2Fubm90IHVzZSB0aGUKanVzdGlmaWNhdGlvbiB5b3UgYXJlIHVzaW5nLCBiZWNhdXNlIGl0IGlz
IGZhbHNlLCBhbmQgZGVtb25zdHJhdGVzIGEKbGFjayBvZiB1bmRlcnN0YW5kaW5nIGZvciBob3cg
aW5saW5lIGFzc2VtYmx5IHdvcmtzLiBJdCBoYXMgdG8gYmUKY29ycmVjdGx5IGp1c3RpZmllZC4K
CihJIGRvIG5vdGUgdGhhdCBuZWl0aGVyIHg4NiBub3IgYXJtNjQgc2VlbXMgdG8gbW9kZWwgdGhp
cyBhcyBhbiBvdXRwdXQpCgpKZXNzCgo+IFNpZ25lZC1vZmYtYnk6IEppc2hlbmcgWmhhbmcgPGpz
emhhbmdAa2VybmVsLm9yZz4KPiBTaWduZWQtb2ZmLWJ5OiBDeXJpbCBCdXIgPGN5cmlsYnVyQHRl
bnN0b3JyZW50LmNvbT4KPiAtLS0KPiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3VhY2Nlc3MuaCB8
IDE4ICsrKysrKysrKy0tLS0tLS0tLQo+IDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyks
IDkgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20v
dWFjY2Vzcy5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS91YWNjZXNzLmgKPiBpbmRleCAwOWQ0
Y2EzNzUyMmMuLjg0YjA4NGUzODhhNyAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL3VhY2Nlc3MuaAo+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vdWFjY2Vzcy5oCj4g
QEAgLTE4NiwxMSArMTg2LDExIEBAIGRvIHsgXAo+IF9fdHlwZW9mX18oKihwdHIpKSBfX3ggPSB4
OyBcCj4gX19hc21fXyBfX3ZvbGF0aWxlX18gKCBcCj4gIjE6XG4iIFwKPiAtICIgIiBpbnNuICIg
JXoyLCAlMVxuIiBcCj4gKyAiICIgaW5zbiAiICV6MSwgJTJcbiIgXAo+ICIyOlxuIiBcCj4gX0FT
TV9FWFRBQkxFX1VBQ0NFU1NfRVJSKDFiLCAyYiwgJTApIFwKPiAtIDogIityIiAoZXJyKSwgIj1t
IiAoKihwdHIpKSBcCj4gLSA6ICJySiIgKF9feCkpOyBcCj4gKyA6ICIrciIgKGVycikgXAo+ICsg
OiAickoiIChfX3gpLCAibSIoKihwdHIpKSk7IFwKPiB9IHdoaWxlICgwKQo+IAo+ICNpZmRlZiBD
T05GSUdfNjRCSVQKPiBAQCAtMjAzLDE2ICsyMDMsMTYgQEAgZG8geyBcCj4gdTY0IF9feCA9IChf
X3R5cGVvZl9fKCh4KS0oeCkpKSh4KTsgXAo+IF9fYXNtX18gX192b2xhdGlsZV9fICggXAo+ICIx
OlxuIiBcCj4gLSAiIHN3ICV6MywgJTFcbiIgXAo+ICsgIiBzdyAlejEsICUzXG4iIFwKPiAiMjpc
biIgXAo+IC0gIiBzdyAlejQsICUyXG4iIFwKPiArICIgc3cgJXoyLCAlNFxuIiBcCj4gIjM6XG4i
IFwKPiBfQVNNX0VYVEFCTEVfVUFDQ0VTU19FUlIoMWIsIDNiLCAlMCkgXAo+IF9BU01fRVhUQUJM
RV9VQUNDRVNTX0VSUigyYiwgM2IsICUwKSBcCj4gLSA6ICIrciIgKGVyciksIFwKPiAtICI9bSIg
KF9fcHRyW19fTFNXXSksIFwKPiAtICI9bSIgKF9fcHRyW19fTVNXXSkgXAo+IC0gOiAickoiIChf
X3gpLCAickoiIChfX3ggPj4gMzIpKTsgXAo+ICsgOiAiK3IiIChlcnIpIFwKPiArIDogInJKIiAo
X194KSwgInJKIiAoX194ID4+IDMyKSwgXAo+ICsgIm0iIChfX3B0cltfX0xTV10pLCBcCj4gKyAi
bSIgKF9fcHRyW19fTVNXXSkpOyBcCj4gfSB3aGlsZSAoMCkKPiAjZW5kaWYgLyogQ09ORklHXzY0
QklUICovCj4gCj4gLS0gCj4gMi4zNC4xCj4gCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KPiBsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKPiBsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
