Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB880D5D683
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Nov 2024 18:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0O1C97VX1JE50a6/U9P0o/AWQwmpzC1tWD3q9zAadfw=; b=2XQewcQbij0J8I
	q+aUMCgeyJ3KEqK6WimtiB3SyJ0b+extWZamXScdjadS2T/4A5Icp4LjMYYGYMJokSKrdU9RFRyie
	vaNr1z3Fv0cb7hmhGxruXmWSe/QaeTJhBc+co1n1R4YOxTLOTBxjpjVRDxXwUS8V3Yf/yhbgZ4YXN
	ld5emvBNA97Wg0GpHTVIM7eo2cdbWw1ze591lc7nNvZmsDSIXmUt9ztWo8aP0LQDuiFPncpOzHl2T
	vjwj2sg6a7UnZ+DwLJ5GBprqVghWTXvgzHORo397F6HS6+mswLNrh1HakbWF0nDv9W6AQmZWV5FUT
	/dr699yw+YvwnygQZzNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t97dM-00000007yuY-3kAj;
	Thu, 07 Nov 2024 18:53:32 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t97c3-00000007ylw-0v6P
	for linux-riscv@lists.infradead.org;
	Thu, 07 Nov 2024 18:52:12 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-20c8ac50b79so17985ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 07 Nov 2024 10:52:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731005530; x=1731610330; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8eBN8ymnBc8p9QxnxQVe7atvkFMrTJybu6XE4oODfEs=;
        b=cdrxWasy4hH1paK51LhuC5ZUQI5hZzfu/vuI5TpKNcCw1DAm98Sph2No6A7WkXJ7I7
         qCjWb2upx8c98Z0EaObzDhEU1Q2ShfjfCKmInxJrjeE4Q9d8uQwYGqyMaaDZVtU4IJBX
         v/4kvjjOaJQcHtnSGJUGgzYaRMAHaGCVBWSJmjzyb0mLR0ujzl8Iuke2Hb3W2wYaudgw
         6Xr+adRrMF43bVHxxYROk1XY3xYoufDXcFuVeSrlKeuq5oA+s8ePioxKInIsZhjFumS2
         IUPAic01aqvAAOfeq4Men19fOFh6vLkBVe93djjbFwSCM+fAZlmSglFJq2FOrEZZs9vI
         OZTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731005530; x=1731610330;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8eBN8ymnBc8p9QxnxQVe7atvkFMrTJybu6XE4oODfEs=;
        b=pybxtNhrpyqglRM1R+wBeblkTYzaH75f78TVof+t2TdUIMAf3uTMe4Z0DsNUrm/MCQ
         Bv3Fe0DDXVRFUkDP4pCjM4LIc/3uea0LSCH/AlyK3E2yhx0BIegAi2fszJYG9Z5V9M6m
         BROJpZUSSf/CPDcbddDKzYUBHrzRJUeYKjNyux1BIIhA2H7F+GaiqOGKILkjPinlMTbb
         5BlybwXBrUpT6TTM13tTipvcUUxwgDXMaQYixkcg/HEkO4TwZQhLj5ckfsmJzfHOi4MM
         cDopB4VRqBV26CKT2UT3bYXqjrSs47ZAHrtbxWbkhWZV9IkjzsLVVd2osVj4s3EScrLQ
         HByA==
X-Forwarded-Encrypted: i=1; AJvYcCU095FEoM+a/p/WpMiaahK15TxjakufJMciSorDc9pzbBTLh5mXzIWx9BAXtF5jh7z8MrcvHY3HlkeWAQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3Cb2zSF0YBk/LPrGtktPQNkMRFLcg/8Lj249zkzhsUfL6pTMv
	Hs9WDtUhtmB0k7Q7073VrtRILPQ7Pzq947vzUzaQAGqyVZGCCCIU0zLuuTLTj5lhaPTX+1x7bdD
	NwIYhoF4r22nPoCSnYojB43mRV+65mg69tISXOfnMrF8lredMBW7u
X-Gm-Gg: ASbGncusmVbQzPsoPJbcWBlkTiQbmPhSra2PwPkX/0XKMJGDdgpbNAGR2kXUmJ6MyHx
	eTut+v9y3KY8QNi/QdC9EHeCQnzfNUTruKSL0WCh3iWjZ2xZ1mSvWW7a2Z/eLUuM=
X-Google-Smtp-Source: AGHT+IGvx7KFsyMX5+AYcMaGovXO3S3lUt1B/FRKeJuNVZEWZxKDX6Uv2YyfvW7lg1pESwLCE/Oq1UyOTpc16+leygo=
X-Received: by 2002:a17:903:41ce:b0:205:60ef:18af with SMTP id
 d9443c01a7336-211749d3e94mr3901475ad.29.1731005529781; Thu, 07 Nov 2024
 10:52:09 -0800 (PST)
MIME-Version: 1.0
References: <20241026121758.143259-1-irogers@google.com>
In-Reply-To: <20241026121758.143259-1-irogers@google.com>
From: Ian Rogers <irogers@google.com>
Date: Thu, 7 Nov 2024 10:51:58 -0800
Message-ID: <CAP-5=fXf9HtqKZyvfXNbKLTB-dL_Ax5Hd0_Gn1J-y0T1SE9wLQ@mail.gmail.com>
Subject: Re: [PATCH v1 0/4] Prefer sysfs/JSON events also when no PMU is provided
To: Atish Patra <atishp@rivosinc.com>, James Clark <james.clark@linaro.org>, 
	linux-perf-users@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Ben Gainey <ben.gainey@arm.com>, 
	Junhao He <hejunhao3@huawei.com>, linux-riscv@lists.infradead.org, beeman@rivosinc.com, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Kan Liang <kan.liang@linux.intel.com>, 
	Ze Gao <zegao2021@gmail.com>, Weilin Wang <weilin.wang@intel.com>, 
	Dominique Martinet <asmadeus@codewreck.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_105211_270600_CC718237 
X-CRM114-Status: GOOD (  26.83  )
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

T24gU2F0LCBPY3QgMjYsIDIwMjQgYXQgNToxOOKAr0FNIElhbiBSb2dlcnMgPGlyb2dlcnNAZ29v
Z2xlLmNvbT4gd3JvdGU6Cj4KPiBBdCB0aGUgUklTQy1WIHN1bW1pdCB0aGUgdG9waWMgb2YgYXZv
aWRpbmcgZXZlbnQgZGF0YSBiZWluZyBpbiB0aGUKPiBSSVNDLVYgUE1VIGtlcm5lbCBkcml2ZXIg
Y2FtZSB1cC4gVGhlcmUgaXMgYSBwcmVmZXJlbmNlIGZvciBzeXNmcy9KU09OCj4gZXZlbnRzIGJl
aW5nIHRoZSBwcmlvcml0eSB3aGVuIG5vIFBNVSBpcyBwcm92aWRlZCBzbyB0aGF0IGxlZ2FjeQo+
IGV2ZW50cyBtYXliZSBzdXBwb3J0ZWQgdmlhIGpzb24uIE9yaWdpbmFsbHkgTWFyayBSdXRsYW5k
IGFsc28KPiBleHByZXNzZWQgYXQgTFBDIDIwMjMgdGhhdCBkb2luZyB0aGlzIHdvdWxkIHJlc29s
dmUgYnVncyBvbiBBUk0gQXBwbGUKPiBNPyBwcm9jZXNzb3JzLCBidXQgSmFtZXMgQ2xhcmsgbW9y
ZSByZWNlbnRseSB0ZXN0ZWQgdGhpcyBhbmQgYmVsaWV2ZXMKPiB0aGUgZHJpdmVyIGlzc3VlcyB0
aGVyZSBtYXkgbm90IGhhdmUgZXhpc3RlZCBvciBoYXZlIGJlZW4gcmVzb2x2ZWQuIEluCj4gYW55
IGNhc2UsIGl0IGlzIGluY29uc2lzdGVudCB0aGF0IHdpdGggYSBQTVUgZXZlbnQgbmFtZXMgYXZv
aWQgbGVnYWN5Cj4gZW5jb2RpbmdzLCBidXQgd2hlbiB3aWxkY2FyZGluZyBQTVVzIChpZSB3aXRo
b3V0IGEgUE1VIHdpdGggdGhlIGV2ZW50Cj4gbmFtZSkgdGhlIGxlZ2FjeSBlbmNvZGluZ3MgaGF2
ZSBwcmlvcml0eS4KPgo+IFRoZSBwYXRjaCBkb2luZyB0aGlzIHdvcmsgd2FzIHJldmVydGVkIGlu
IGEgdjYuMTAgcmVsZWFzZSBjYW5kaWRhdGUKPiBhcywgZXZlbiB0aG91Z2ggdGhlIHBhdGNoIHdh
cyBwb3N0ZWQgZm9yIHdlZWtzIGFuZCBoYWQgYmVlbiBvbgo+IGxpbnV4LW5leHQgZm9yIHdlZWtz
IHdpdGhvdXQgaXNzdWUsIExpbnVzIHdhcyBpbiB0aGUgaGFiaXQgb2YgdXNpbmcKPiBleHBsaWNp
dCBsZWdhY3kgZXZlbnRzIHdpdGggdW5zdXBwb3J0ZWQgcHJlY2lzaW9uIG9wdGlvbnMgb24gaGlz
Cj4gTmVvdmVyc2UtTjEuIFRoaXMgbWFjaGluZSBoYXMgU0xDIFBNVSBldmVudHMgZm9yIGJ1cyBh
bmQgQ1BVIGN5Y2xlcwo+IHdoZXJlIEFSTSBkZWNpZGVkIHRvIGNhbGwgdGhlIGV2ZW50cyBidXNf
Y3ljbGVzIGFuZCBjeWNsZXMsIHRoZSBsYXR0ZXIKPiBiZWluZyBhbHNvIGEgbGVnYWN5IGV2ZW50
IG5hbWUuIEFSTSBoYXZlbid0IHJlbmFtZWQgdGhlIGN5Y2xlcyBldmVudAo+IHRvIGEgbW9yZSBj
b25zaXN0ZW50IGNwdV9jeWNsZXMgYW5kIGF2b2lkZWQgdGhlIHByb2JsZW0uIFdpdGggdGhlc2UK
PiBjaGFuZ2VzIHRoZSBwcm9ibGVtYXRpYyBldmVudCB3aWxsIG5vdyBiZSBza2lwcGVkLCBhIGxh
cmdlIHdhcm5pbmcKPiBwcm9kdWNlZCwgYW5kIHBlcmYgcmVjb3JkIHdpbGwgY29udGludWUgZm9y
IHRoZSBvdGhlciBQTVUgZXZlbnRzLiBUaGlzCj4gc29sdXRpb24gd2FzIHByb3Bvc2VkIGJ5IEFy
bmFsZG8uCj4KPiBUd28gbWlub3IgY2hhbmdlcyBoYXZlIGJlZW4gYWRkZWQgdG8gaGVscCB3aXRo
IHRoZSBlcnJvciBtZXNzYWdlIGFuZAo+IHRvIHdvcmsgYXJvdW5kIGlzc3VlcyBvY2N1cnJpbmcg
d2l0aCAicGVyZiBzdGF0IG1ldHJpY3MgKHNoYWRvdyBzdGF0KQo+IHRlc3QiLgo+Cj4gVGhlIHBh
dGNoZXMgaGF2ZSBvbmx5IGJlZW4gdGVzdGVkIG9uIG15IHg4NiBub24taHlicmlkIGxhcHRvcC4K
CkhpIEF0aXNoIGFuZCBKYW1lcywKCkNvdWxkIEkgZ2V0IHlvdXIgdGFncyBmb3IgdGhpcyBzZXJp
ZXM/CgpUaGUgcGF0Y2hlcyB3ZXJlIG9yaWdpbmFsbHkgbW90aXZhdGVkIGJ5IHdhbnRpbmcgdG8g
bWFrZSB0aGUgYmVoYXZpb3IKb2YgZXZlbnRzIHBhcnNlZCBsaWtlICJjeWNsZXMiIG1hdGNoIHRo
YXQgb2YgImNwdS9jeWNsZXMvIiwgdGhlIFBNVSBpcwp3aWxkY2FyZGVkIHRvICJjcHUiIGluIHRo
ZSBmaXJzdCBjYXNlLiBUaGlzIHdhcyBkaXZlcmdlbnQgYmVjYXVzZSBvZgpBUk0gd2Ugc3dpdGNo
ZWQgZnJvbSBwcmVmZXJyaW5nIGxlZ2FjeSAodHlwZSA9IFBFUkZfVFlQRV9IQVJEV0FSRSwKY29u
ZmlnID0gUEVSRl9DT1VOVF9IV19DUFVfQ1lDTEVTKSB0byBzeXNmcy9qc29uICh0eXBlPTxjb3Jl
IFBNVSdzCnR5cGU+LCBjb25maWc9PGVuY29kaW5nIGZyb20gZXZlbnQ+KSB3aGVuIGEgUE1VIG5h
bWUgd2FzIGdpdmVuLiBUaGlzCmFsaWducyB3aXRoIFJJU0MtViB3YW50aW5nIHRvIHVzZSBqc29u
IGVuY29kaW5ncyB0byBhdm9pZCBjb21wbGV4aXR5CmluIHRoZSBQTVUgZHJpdmVyLgoKSmFtZXMs
IGNvdWxkIHlvdSBzaG93IHRoZSBuZW92ZXJzZSB3aXRoIHRoZSBjbW4gUE1VIGJlaGF2aW9yIGZv
ciBwZXJmCnJlY29yZCBvZiAiY3ljbGVzOnBwIiBkdWUgdG8gc2Vuc2l0aXZpdGllcyB0aGVyZS4K
ClRoYW5rcywKSWFuCgoKCgo+IElhbiBSb2dlcnMgKDQpOgo+ICAgcGVyZiBldnNlbDogQWRkIHBt
dV9uYW1lIGhlbHBlcgo+ICAgcGVyZiBzdGF0OiBGaXggZmluZF9zdGF0IGZvciBtaXhlZCBsZWdh
Y3kvbm9uLWxlZ2FjeSBldmVudHMKPiAgIHBlcmYgcmVjb3JkOiBTa2lwIGRvbid0IGZhaWwgZm9y
IGV2ZW50cyB0aGF0IGRvbid0IG9wZW4KPiAgIHBlcmYgcGFyc2UtZXZlbnRzOiBSZWFwcGx5ICJQ
cmVmZXIgc3lzZnMvSlNPTiBoYXJkd2FyZSBldmVudHMgb3Zlcgo+ICAgICBsZWdhY3kiCj4KPiAg
dG9vbHMvcGVyZi9idWlsdGluLXJlY29yZC5jICAgIHwgMjIgKysrKysrKy0tLQo+ICB0b29scy9w
ZXJmL3V0aWwvZXZzZWwuYyAgICAgICAgfCAxMCArKysrKwo+ICB0b29scy9wZXJmL3V0aWwvZXZz
ZWwuaCAgICAgICAgfCAgMSArCj4gIHRvb2xzL3BlcmYvdXRpbC9wYXJzZS1ldmVudHMuYyB8IDI2
ICsrKysrKysrKy0tLQo+ICB0b29scy9wZXJmL3V0aWwvcGFyc2UtZXZlbnRzLmwgfCA3NiArKysr
KysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tCj4gIHRvb2xzL3BlcmYvdXRpbC9wYXJzZS1l
dmVudHMueSB8IDYwICsrKysrKysrKysrKysrKysrKy0tLS0tLS0tLQo+ICB0b29scy9wZXJmL3V0
aWwvcG11cy5jICAgICAgICAgfCAyMCArKysrKysrLS0KPiAgdG9vbHMvcGVyZi91dGlsL3N0YXQt
c2hhZG93LmMgIHwgIDMgKy0KPiAgOCBmaWxlcyBjaGFuZ2VkLCAxNDUgaW5zZXJ0aW9ucygrKSwg
NzMgZGVsZXRpb25zKC0pCj4KPiAtLQo+IDIuNDcuMC4xNjMuZzEyMjZmNmQ4ZmEtZ29vZwo+Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
