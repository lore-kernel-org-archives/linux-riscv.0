Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 231DBE75420
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Oct 2023 04:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sraOKvjDltig7FDVUQonspXG1JkA4s8y6Ce4h1h0/74=; b=oRP83XwE+QmDwD
	pHYU9UdIMczs7itdNvNqpO+TQ85R9XH0+PbwVifxoAKa6jGodEzeiGde8tVMfSSyZBwExjc47JiML
	/GRUk7yGawkOcoI2umlAchqac8Ng7EMJS+7tKKz1wtlS+CAngN/SWO6LSUEQD1gFMz/GaHme63AjB
	SynMerz6u1ZFCkYYlsFM7TYdURpyirXSFgVosjrcD+lpja6kz6QaJov10SW9QyhpeIjDnj7hJOtmX
	QIHCCVh2nIzIiJ46G8j8kQa+JR7GX4rUW17jLz1tA0oj1lJytTlBUpJnV9zOvtP6KjTYeyHGK3we+
	FqoYBKEo0UEpQx1w2U9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnXAQ-00DnOg-2Y;
	Tue, 03 Oct 2023 04:37:54 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnXAM-00DnNh-2C
	for linux-riscv@lists.infradead.org;
	Tue, 03 Oct 2023 04:37:53 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-693375d2028so369096b3a.2
        for <linux-riscv@lists.infradead.org>; Mon, 02 Oct 2023 21:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1696307868; x=1696912668; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GKgPQ38AECrVlc0moMdpWxxk1GnLwNaF/JmBiOPzlGM=;
        b=sVrh2mBFZF0o3WX5/gyf5dLPZo/MOiJ3htwsyLxQK1OVRgkAqSKihhIOJzlvb9pRNl
         gf0axq8tvDqdSyEqnG7ybgj7yPM46pIigDnWwQ3nUMEsvWh3zdoD2oeDU/pYvelX4598
         208uVzW7Gixo1odTm8geyUPV3BvK0RgWE6I8fo28b6MZa5yRKAUI4BBrH61g8nsasjDF
         0uGsSMJNdBSbtchX+I7/Pp9+Zx8uI7N0vmurnK6Sg9G7eWx5bnEbxYzU8Mzo4gJsyDON
         LM4Jmjk9TqKWoO/QIgdqBxUjPcHc2cQhJcW/GbnLvUAvtIAh9/V74jyMEvfwNhEcqzA+
         b6xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696307868; x=1696912668;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GKgPQ38AECrVlc0moMdpWxxk1GnLwNaF/JmBiOPzlGM=;
        b=Z5odYltDpSP6hb0LK7yJGqKfWXghWttqgDlO4GAx+JLv5T5nC9vxLkufsmbXrLB4O3
         4Bgcuq1IWLPBkvtLCxU/Cvgd36JNQ9IX7+t5jPsHrjxnz3c8BkADAAjGR2Mqn3vILofT
         xFhmaXE4MMGsaesNqVTwAHat/pJu5ESt+HJ1rGlO+Kf/8URItNfLkEJUUSyo6Z+MXoDS
         P9+fyszjb4UEUgSeLkYrE7nsZlHs25f1oJQmXCTVH/4c/G28SrCOboTqAdlyGe7EbDbO
         RV+DacKNJ7U6+3Dc0NYGyoOH0tup9xYWt7haFQQreiQEGtfTlOs4DrAMazanNPOM4fTg
         1Rww==
X-Gm-Message-State: AOJu0YxoiPn0aZnIj/+Zf+tkew4tDvx1jJAF1Flw/f0l7EMA0xwcGtXM
	SPwFuAmGk9GM7GkNB9bzowPB8A==
X-Google-Smtp-Source: AGHT+IGcJswyqq2+v8adfeB7JFHPk6IW7uTaWtSmL6Jtu5yzeYDhKrvLZYKMEUvZXOisUIZVOAzPIw==
X-Received: by 2002:aa7:88c1:0:b0:68f:dfda:1814 with SMTP id k1-20020aa788c1000000b0068fdfda1814mr16065099pff.18.1696307868388;
        Mon, 02 Oct 2023 21:37:48 -0700 (PDT)
Received: from x1 ([2601:1c2:1800:f680:6f96:60b4:c2b:8120])
        by smtp.gmail.com with ESMTPSA id z9-20020aa785c9000000b00692acfc4b3csm332716pfn.136.2023.10.02.21.37.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 21:37:48 -0700 (PDT)
Date: Mon, 2 Oct 2023 21:37:44 -0700
From: Drew Fustini <dfustini@baylibre.com>
To: Robert Nelson <robertcnelson@gmail.com>,
	Prabhakar <prabhakar.csengg@gmail.com>
Subject: Re: [PATCH 0/6] RISC-V: Add eMMC support for TH1520 boards
Message-ID: <ZRuamJuShOnvP1pr@x1>
References: <20230921-th1520-mmc-v1-0-49f76c274fb3@baylibre.com>
 <CAOCHtYhnx1EpBM+o3xhdsicx5uqLidojK3f0HQ+VfyVv1ZXnVQ@mail.gmail.com>
 <CAOCHtYi5Ab5ppCmaQV3QuKQcpmJX+sHdAmtuEXhfq8xf5fFCYQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOCHtYi5Ab5ppCmaQV3QuKQcpmJX+sHdAmtuEXhfq8xf5fFCYQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_213750_931845_1BC70FE4 
X-CRM114-Status: GOOD (  31.25  )
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Jisheng Zhang <jszhang@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, Guo Ren <guoren@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, Han Gao <gaohan@iscas.ac.cn>, Jason Kridner <jkridner@beagleboard.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Xi Ruoyao <xry111@xry111.site>, Fu Wei <wefu@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gRnJpLCBTZXAgMjIsIDIwMjMgYXQgMDU6NDg6MjFQTSAtMDUwMCwgUm9iZXJ0IE5lbHNvbiB3
cm90ZToKPiBPbiBGcmksIFNlcCAyMiwgMjAyMyBhdCAyOjA44oCvUE0gUm9iZXJ0IE5lbHNvbiA8
cm9iZXJ0Y25lbHNvbkBnbWFpbC5jb20+IHdyb3RlOgo+ID4KPiA+IE9uIFRodSwgU2VwIDIxLCAy
MDIzIGF0IDg6NTHigK9QTSBEcmV3IEZ1c3RpbmkgPGRmdXN0aW5pQGJheWxpYnJlLmNvbT4gd3Jv
dGU6Cj4gPiA+Cj4gPiA+IFRoaXMgc2VyaWVzIGFkZHMgc3VwcG9ydCBmb3IgdGhlIGVNTUMgb24g
dGhlIEJlYWdsZVYgQWhlYWQgYW5kIHRoZQo+ID4gPiBTaXBlZWQgTGljaGVlUGkgNEEuIFRoaXMg
YWxsb3dzIHRoZSBrZXJuZWwgdG8gYm9vdCB3aXRoIHRoZSByb290ZnMgb24KPiA+ID4gZU1NQy4K
PiA+ID4KPiA+ID4gSSB0ZXN0ZWQgb24gdG9wIG9mIHY2LjYtcmMyIHdpdGggdGhpcyBjb25maWcg
WzFdLiBJIHdhcyBhYmxlIHRvIGJvb3QKPiA+ID4gYm90aCB0aGUgQWhlYWQgWzJdIGFuZCBMUGk0
YSBbM10gZnJvbSBlTU1DLiBUaGUgZm9sbG93aW5nIHByZXJlcXVpc2l0ZXMKPiA+ID4gYXJlIHJl
cXVpcmVkOgo+ID4gPgo+ID4gPiAgIFtQQVRDSCB2Ml0gcmlzY3Y6IGR0czogdGhlYWQ6IHNldCBk
bWEtbm9uY29oZXJlbnQgdG8gc29jIGJ1cyBbNF0KPiA+ID4KPiA+ID4gSSBwdXNoZWQgYSBicmFu
Y2ggWzVdIHdpdGggdGhpcyBwYXRjaCBzZXJpZXMgYW5kIHRoZSBhYm92ZSBwYXRjaCBmb3IKPiA+
ID4gdGhvc2UgdGhhdCBmaW5kIGEgZ2l0IGJyYW5jaCBlYXNpZXIgdG8gdGVzdC4KPiA+ID4KPiA+
ID4gUGxlYXNlIG5vdGUgdGhhdCBvbmx5IHRoZSBNTUMgY29udHJvbGxlciBjb25uZWN0ZWQgdG8g
dGhlIGVNTUMgZGV2aWNlCj4gPiA+IGlzIGVuYWJsZWQgaW4gdGhlIGRldmljZSB0cmVlcyBmb3Ig
dGhlc2UgdHdvIGJvYXJkcy4gSSBkaWQgbm90IHlldAo+ID4gPiBhdHRlbXB0IHRvIGNvbmZpZ3Vy
ZSBhbmQgdXNlIHRoZSBtaWNyb1NEIGNhcmQgc2xvdC4gTXkgcHJlZmVyZW5jZSBpcyB0bwo+ID4g
PiBhZGRyZXNzIHRoYXQgaW4gYSBmdXR1cmUgcGF0Y2ggc2VyaWVzLgo+ID4gPgo+ID4gPiBSZWZl
cmVuY2VzOgo+ID4gPiBbMV0gaHR0cHM6Ly9naXN0LmdpdGh1Yi5jb20vcGRwNy81ZmJkY2YyYTY1
ZWIxYWJkZDNhMjlkNTE5YzE5Y2RkMgo+ID4gPiBbMl0gaHR0cHM6Ly9naXN0LmdpdGh1Yi5jb20v
cGRwNy85MWE4MDFhNWY4ZDEwNzBjNTM1MDllZGE5ODAwYWQ3OAo+ID4gPiBbM10gaHR0cHM6Ly9n
aXN0LmdpdGh1Yi5jb20vcGRwNy8xNDQ1YzNjOTkxZTg4ZmQ2OWM2MDE2NWNlZjY1NzI2YQo+ID4g
PiBbNF0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcmlzY3YvMjAyMzA5MTIwNzIyMzIu
MjQ1NS0xLWpzemhhbmdAa2VybmVsLm9yZy8KPiA+ID4gWzVdIGh0dHBzOi8vZ2l0aHViLmNvbS9w
ZHA3L2xpbnV4L3RyZWUvYjQvdGgxNTIwLW1tYwo+ID4KPiA+IFRoaXMgcGF0Y2hzZXQgY2FtZSBv
dXQgdmVyeSBuaWNlIQo+ID4KPiA+IHY2LjYtcmMyIHdpdGggTGFzdCBSRkMgdjI6Cj4gPgo+ID4g
WyAgICA0LjA2NjYzMF0gbW1jMDogU0RIQ0kgY29udHJvbGxlciBvbiBmZmU3MDgwMDAwLm1tYwo+
ID4gW2ZmZTcwODAwMDAubW1jXSB1c2luZyBQSU8KPiA+Cj4gPiBkZWJpYW5AQmVhZ2xlVjp+JCBz
dWRvIGhkcGFybSAtdFQgL2Rldi9tbWNibGswCj4gPgo+ID4gL2Rldi9tbWNibGswOgo+ID4gIFRp
bWluZyBjYWNoZWQgcmVhZHM6ICAgMTUxNiBNQiBpbiAgMi4wMCBzZWNvbmRzID0gNzU4LjA5IE1C
L3NlYwo+ID4gIFRpbWluZyBidWZmZXJlZCBkaXNrIHJlYWRzOiAgODQgTUIgaW4gIDMuMDEgc2Vj
b25kcyA9ICAyNy45NCBNQi9zZWMKPiA+Cj4gPiB2cyB2Ni42LXJjMiB3aXRoIHRoaXMgcGF0Y2hz
ZXQ6Cj4gPgo+ID4gIFsgICAgNC4wOTY4MzddIG1tYzA6IFNESENJIGNvbnRyb2xsZXIgb24gZmZl
NzA4MDAwMC5tbWMKPiA+IFtmZmU3MDgwMDAwLm1tY10gdXNpbmcgRE1BCj4gPgo+ID4gZGViaWFu
QEJlYWdsZVY6fiQgc3VkbyBoZHBhcm0gLXRUIC9kZXYvbW1jYmxrMAo+ID4KPiA+IC9kZXYvbW1j
YmxrMDoKPiA+ICBUaW1pbmcgY2FjaGVkIHJlYWRzOiAgIDE1ODAgTUIgaW4gIDIuMDAgc2Vjb25k
cyA9IDc5MC45NyBNQi9zZWMKPiA+ICBUaW1pbmcgYnVmZmVyZWQgZGlzayByZWFkczogNDE4IE1C
IGluICAzLjAwIHNlY29uZHMgPSAxMzkuMTEgTUIvc2VjCj4gCj4gRHJldyBwb2ludGVkIG91dCBv
biBTbGFjaywgdGhpcyB3YXMgbm90IHF1aXRlIHJpZ2h0Li4gQWZ0ZXIgbW9yZQo+IGRpZ2dpbmcg
YnkgRHJldywgQ09ORklHX0RNQV9HTE9CQUxfUE9PTCBpcyBjYXVzaW5nIGEgRE1BIGxpbWl0YXRp
b24KPiB3aXRoIHRoZSBtdWx0aXBsYXRmb3JtIGRlZmNvbmZpZy4gc28gd2l0aCwKPiAKPiAuL3Nj
cmlwdHMvY29uZmlnIC0tZGlzYWJsZSBDT05GSUdfQVJDSF9SOUEwN0cwNDMKPiAKPiAodG8gcmVt
b3ZlIENPTkZJR19ETUFfR0xPQkFMX1BPT0wpLi4uIGFub3RoZXIgMnggaW4gYnVmZmVyZWQgcmVh
ZHMuLgo+IAo+IFsgICAgNC4wNTkyNDJdIG1tYzA6IFNESENJIGNvbnRyb2xsZXIgb24gZmZlNzA4
MDAwMC5tbWMKPiBbZmZlNzA4MDAwMC5tbWNdIHVzaW5nIEFETUEgNjQtYml0Cj4gCj4gZGViaWFu
QEJlYWdsZVY6fiQgc3VkbyBoZHBhcm0gLXRUIC9kZXYvbW1jYmxrMAo+IAo+IC9kZXYvbW1jYmxr
MDoKPiAgVGltaW5nIGNhY2hlZCByZWFkczogICAxNjAwIE1CIGluICAyLjAwIHNlY29uZHMgPSA4
MDAuOTMgTUIvc2VjCj4gIFRpbWluZyBidWZmZXJlZCBkaXNrIHJlYWRzOiA4OTIgTUIgaW4gIDMu
MDAgc2Vjb25kcyA9IDI5Ny4wNiBNQi9zZWMKCkl0IHNlZW1zIENPTkZJR19ETUFfR0xPQkFMX1BP
T0w9eSBjYXVzZXMgQURNQSBidWZmZXIgYWxsb2MgdG8gZmFpbCBbMV06CgogIG1tYzA6IFVuYWJs
ZSB0byBhbGxvY2F0ZSBBRE1BIGJ1ZmZlcnMgLSBmYWxsaW5nIGJhY2sgdG8gc3RhbmRhcmQgRE1B
CgpQcmFiaGFrYXIncyBBWDQ1TVAgbm9uLWNvaGVyZW50IERNQSBzdXBwb3J0IFsyXSBzZXJpZXMg
aW50cm9kdWNlZCB0aGUKc2VsZWN0aW9uIG9mIERNQV9HTE9CQUxfUE9PTCBmb3IgQVJDSF9SOUEw
N0cwNDMgYW5kIHRoZSByaXNjdiBkZWZjb25maWcKc2VsZWN0cyBBUkNIX1I5QTA3RzA0My4gCgpQ
YXRjaCA1IGluIHRoZSBzZXJpZXMgWzNdIHN0YXRlcyB0aGF0OgoKICBXaXRoIERNQV9HTE9CQUxf
UE9PTCBlbmFibGVkIGFsbCBETUEgYWxsb2NhdGlvbnMgaGFwcGVuIGZyb20gdGhpcwogIHJlZ2lv
biBhbmQgc3luY2hyb25pemF0aW9uIGNhbGxiYWNrcyBhcmUgaW1wbGVtZW50ZWQgdG8gc3luY2hy
b25pemUKICB3aGVuIGRvaW5nIERNQSB0cmFuc2FjdGlvbnMuCgpUaGlzIGV4YW1wbGUgb2YgYSAi
c2hhcmVkLWRtYS1wb29sIiBub2RlIHdhcyBnaXZlbjoKCiAgICAgICAgcG1hX3Jlc3YwQDU4MDAw
MDAwIHsKICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJzaGFyZWQtZG1hLXBvb2wiOwogICAgICAg
ICAgICByZWcgPSA8MHgwIDB4NTgwMDAwMDAgMHgwIDB4MDgwMDAwMDA+OwogICAgICAgICAgICBu
by1tYXA7CiAgICAgICAgICAgIGxpbnV4LGRtYS1kZWZhdWx0OwogICAgICAgIH07CgpJJ3ZlIGNv
cGllZCB0aGF0IHRvIHRoMTUyMC1iZWFnbGV2LWFoZWFkLmR0cy4gVGhlIGFkZHJlc3Mgb2YgMHg1
ODAwMDAwMApoYXMgbm8gc2lnbmlmaWNhbmNlIG9uIHRoMTUyMCwgYnV0IHRoZSBleGlzdGVuY2Ug
b2Ygc2hhcmVkLWRtYS1wb29sCnNlZW1zIHRvIGZpeCB0aGUgcHJvYmxlbS4gQURNQSBtb2RlIFs0
XSBpcyBub3cgd29ya2luZyBldmVuIHRob3VnaApDT05GSUdfRE1BX0dMT0JBTF9QT09MPXkuCgpU
aGFua3MsCkRyZXcKClsxXSBodHRwczovL2dpc3QuZ2l0aHViLmNvbS9wZHA3LzczMDQxZWQ4MDhi
YmM3ZGQ0NDU4MzZmYjkwNTc0OTc5ClsyXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1y
aXNjdi8yMDIzMDgxODEzNTcyMy44MDYxMi0xLXByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5y
ZW5lc2FzLmNvbS8KWzNdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2LzIwMjMw
ODE4MTM1NzIzLjgwNjEyLTYtcHJhYmhha2FyLm1haGFkZXYtbGFkLnJqQGJwLnJlbmVzYXMuY29t
LwpbNF0gaHR0cHM6Ly9naXN0LmdpdGh1Yi5jb20vcGRwNy85MWU3MmE2NjNkM2JiNzNlYjI4MTgy
MzM3YWQ4YmJjYgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
