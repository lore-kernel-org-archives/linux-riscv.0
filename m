Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E1A9C43217
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Oct 2022 02:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=wxNZex/tJFeN1FXzKK2zGT1+O/RJH9oHYyELWoVty2c=; b=yooC7Xkw2t6TrUcsBXUEnOgFMC
	fEFP4HIG1QYj9U8BRrNoZtKr/OrH8cmNuNGGqu1Dq7IxyitQwYTDUyHFTgetSx9dVNwrQzVkv42g0
	gXmKMr4XoLKPZS+QjYI/fzBEWvrnJLVg080DXp3Ep8EjNLFq85eoQtOlzxL6PWuzVlR68gEIyT7/0
	0sTYkJTzIBKCp/hMhi/ZZ4l+SntUi6s3uB3iVo/CEyB1vI+zfU28nW65P+e3ujIBQdSwvMw2tpF39
	WnobSPnmcYn/VV9EXBE94nM0YAb7bgeQPIsDulTaiexl7Q11Zfstl50J27oBKYITFmuji1y2GSZ8e
	6/26+3Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofY5A-008NQh-4P; Tue, 04 Oct 2022 02:54:56 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofY54-008NOT-Ip
	for linux-riscv@lists.infradead.org; Tue, 04 Oct 2022 02:54:54 +0000
Received: by mail-pl1-x634.google.com with SMTP id z20so4935968plb.10
        for <linux-riscv@lists.infradead.org>; Mon, 03 Oct 2022 19:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date;
        bh=bMbyIMpyUL0gZSYHhf+c9J7LwNqUlIt7R/iLTUpZF/I=;
        b=O4CNznk5O8Nv7mb7UvXIhuZjdRyQTlgUxdG74k/QLDKWaDr3J09qizMnjrIivcmIsV
         nK+0bvwJ23q1QUrPryXH8+BbACsA5qguuHj3N4fPgyZfObjMdUoJB+fWGHH3gbd1pn88
         LPWEq82s0km+Ir9zdDkzTHwOUXYsrE/I2qrpYPkquAqs5lqBp6qTsyr0R0mWg4ULo7T6
         gMqxp8TVYxs4OhLeKgbPw/Ld8xzfKQ3/r31puF6ss0vmGSWPX1b27V3TYy3s7+UGmxMQ
         3L5cOV6xW51Du1ctw5axTLQBdBREwmBkzLYVfigVXrqJoLuu5QF0VZ70miy8NZlW+0po
         pQnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date;
        bh=bMbyIMpyUL0gZSYHhf+c9J7LwNqUlIt7R/iLTUpZF/I=;
        b=nEJEsV4HWwa885FyWnlNc2/xmk2nz30bo+QWLeNzx/Mvy1wnI+pj2Bc9J5UijhUHbN
         OuYPAab6NP9nuQmjISwZ14qtn2SuUNMoLJtD6oKZbNOgWWqhn8fycrEidUbNUGoJkQMM
         C5CH7RhiYn8hreiBlKZyKRoBijphQdSpy0BIUciK6w5p5swwH5Quxc/PPGUZxgrVeQYO
         Sx7v7JvhYf+doZa3GVC7KmuuHqjcc3bOGdvAFbCrJhK44LCAuJLxZhUwQunD41RpasTO
         eJke04P2Hpyc2YeqMh2QlwZf6Ua27obT3JwMv8h4ubWPZI0SIJI+0p1JdMTYN4yXE7Zk
         Hskw==
X-Gm-Message-State: ACrzQf1Wwe/Lf6wpOklzQ8YOKcOCQ5IivDMi7m8MFuUuIO+dHbpYUQTj
	m+vqVt1wm3GTRmoxsOPkjY9Elw==
X-Google-Smtp-Source: AMsMyM6E3lu79QRXjV9QidXjjHFx5sZsJcYBr7nw+ZF3kLOdgLKD7bJCetjuV4RxDfKTaWnpHjMg+w==
X-Received: by 2002:a17:902:c412:b0:17f:16ce:3886 with SMTP id k18-20020a170902c41200b0017f16ce3886mr9462795plk.35.1664852081498;
        Mon, 03 Oct 2022 19:54:41 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id r6-20020a63d906000000b0042254fce5e7sm7329518pgg.50.2022.10.03.19.54.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Oct 2022 19:54:40 -0700 (PDT)
Date: Mon, 03 Oct 2022 19:54:40 -0700 (PDT)
X-Google-Original-Date: Mon, 03 Oct 2022 19:54:34 PDT (-0700)
Subject: Re: [PATCH v6 0/3] RISC-V: Create unique identification for SoC PMU
In-Reply-To: <20220815132251.25702-1-nikita.shubin@maquefel.me>
CC: linux@yadro.com, anup@brainfault.org, acme@kernel.org, n.shubin@yadro.com,
  aou@eecs.berkeley.edu, alexander.shishkin@linux.intel.com, mingo@redhat.com, jolsa@kernel.org,
  linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org,
  mark.rutland@arm.com, namhyung@kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
  peterz@infradead.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: nikita.shubin@maquefel.me, acme@redhat.com
Message-ID: <mhng-a8eaa55b-16b0-4b17-b202-881e75a65eaf@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221003_195450_868442_E0D70048 
X-CRM114-Status: GOOD (  18.40  )
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

T24gTW9uLCAxNSBBdWcgMjAyMiAwNjoyMjozNyBQRFQgKC0wNzAwKSwgbmlraXRhLnNodWJpbkBt
YXF1ZWZlbC5tZSB3cm90ZToKPiBGcm9tOiBOaWtpdGEgU2h1YmluIDxuLnNodWJpbkB5YWRyby5j
b20+Cj4KPiBUaGlzIHNlcmllcyBhaW1zIHRvIHByb3ZpZGUgbWF0Y2hpbmcgdmVuZG9yIFNvQyB3
aXRoIGNvcnJlc3BvbmRlZCBKU09OIGJpbmRpbmdzLgo+Cj4gVGhlIElEIHN0cmluZyBpcyBwcm9w
b3NlZCB0byBiZSBpbiBmb3JtIG9mIE1WRU5ET1JJRC1NQVJDSElELU1JTVBJRCwgZm9yIGV4YW1w
bGUKPiBmb3IgU2lmaXZlIFVubWF0Y2hlZCB0aGUgY29ycmVzcG9uZGluZyBzdHJpbmcgd2lsbCBi
ZToKPgo+IDB4NDg5LTB4ODAwMDAwMDAwMDAwMDAwNy0weFtbOnhkaWdpdDpdXSssdjEsc2lmaXZl
L3U3NCxjb3JlCj4KPiBXaGVyZSBNSU1QSUQgY2FuIHZhcnkgYXMgYWxsIGltcGwgc3VwcG9ydGVk
IHRoZSBzYW1lIG51bWJlciBvZiBldmVudHMsIHRoaXMgbWlnaHQgbm90Cj4gYmUgdHJ1ZSBmb3Ig
YWxsIGZ1dHVyZSBTb0MgaG93ZXZlci4KPgo+IEFsc28gYWRkZWQgU0JJIGZpcm13YXJlIGV2ZW50
cyBwcmV0dHkgbmFtZXMsIGFzIGFueSBmaXJtd2FyZSB0aGF0IHN1cHBvcnRzIFNCSSBQTVUKPiBz
aG91bGQgYWxzbyBzdXBwb3J0IGZpcm1hcmUgZXZlbnRzIFsxXS4KPgo+IFNlcmllcyBkZXBlbmRz
IG9uIHBhdGNoIGJ5IEFudXAgUGF0ZWwsIGV4cG9zaW5nIG12ZW5kb3IsIG1hcmNoaWQgYW5kIG1p
bXBpZAo+IHRvICIvcHJvYy9jcHVpbmZvIiBbMl0uCj4KPiBbMV0gaHR0cHM6Ly9naXRodWIuY29t
L3Jpc2N2LW5vbi1pc2EvcmlzY3Ytc2JpLWRvYy9ibG9iL21hc3Rlci9yaXNjdi1zYmkuYWRvYwo+
IFsyXSBodHRwczovL2xrbWwub3JnL2xrbWwvMjAyMi83LzI3LzIzCj4KPiBMaW5rIHRvIHByZXZp
b3VzIHZlcnNpb246Cj4gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4
LXJpc2N2L2xpc3QvP3Nlcmllcz02NTM2NDkKPgo+IFNlZSBvcmlnaW5hbCBjb3ZlciBsZXR0ZXIg
YnkgSm/Do28gTcOhcmlvIERvbWluZ29zOgo+IGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcv
cHJvamVjdC9saW51eC1yaXNjdi9jb3Zlci8yMDIxMTExNjE1NDgxMi4xNzAwOC0xLWpvYW8ubWFy
aW9AdGVjbmljby51bGlzYm9hLnB0Lwo+Cj4gVGVzdGVkIHdpdGggdGhlIGZvbGxvd2luZyBPcGVu
U0JJIGRldmljZSB0cmVlIGJpbmRpbmdzOgo+Cj4gYGBgCj4gcG11IHsKPiAgICAgICAgIGNvbXBh
dGlibGUgPSAicmlzY3YscG11IjsKPiAgICAgICAgIHJpc2N2LGV2ZW50LXRvLW1ocG1jb3VudGVy
cyA9Cj4gICAgICAgICAgICAgICAgIDwweDAzIDB4MDYgMHgxOAo+ICAgICAgICAgICAgICAgICAw
eDEwMDAxIDB4MTAwMDIgMHgxOAo+ICAgICAgICAgICAgICAgICAweDEwMDA5IDB4MTAwMDkgMHgx
OAo+ICAgICAgICAgICAgICAgICAweDEwMDExIDB4MTAwMTEgMHgxOAo+ICAgICAgICAgICAgICAg
ICAweDEwMDE5IDB4MTAwMTkgMHgxOAo+ICAgICAgICAgICAgICAgICAweDEwMDIxIDB4MTAwMjEg
MHgxOD47Cj4gICAgICAgICByaXNjdixldmVudC10by1taHBtZXZlbnQgPQo+ICAgICAgICAgICAg
ICAgICA8MHgwMyAweDAwMDAwMDAwIDB4MTgwMQo+ICAgICAgICAgICAgICAgICAweDA0IDB4MDAw
MDAwMDAgMHgwMzAyCj4gICAgICAgICAgICAgICAgIDB4MDUgMHgwMDAwMDAwMCAweDQwMDAKPiAg
ICAgICAgICAgICAgICAgMHgwNiAweDAwMDAwMDAwIDB4NjAwMQo+ICAgICAgICAgICAgICAgICAw
eDEwMDAxIDB4MDAwMDAwMDAgMHgwMjAyCj4gICAgICAgICAgICAgICAgIDB4MTAwMDIgMHgwMDAw
MDAwMCAweDA0MDIKPiAgICAgICAgICAgICAgICAgMHgxMDAwOSAweDAwMDAwMDAwIDB4MDEwMgo+
ICAgICAgICAgICAgICAgICAweDEwMDExIDB4MDAwMDAwMDAgMHgyMDAyCj4gICAgICAgICAgICAg
ICAgIDB4MTAwMTkgMHgwMDAwMDAwMCAweDEwMDIKPiAgICAgICAgICAgICAgICAgMHgxMDAyMSAw
eDAwMDAwMDAwIDB4MDgwMj47Cj4gICAgICAgICByaXNjdixyYXctZXZlbnQtdG8tbWhwbWNvdW50
ZXJzID0KPiAgICAgICAgICAgICAgICAgPDB4MDAwMDAwMDAgMHgwM2ZmZmYwMCAweDAgMHgwIDB4
MTgKPiAgICAgICAgICAgICAgICAgMHgwMDAwMDAwMCAweDAwMDdmZjAxIDB4MCAweDEgMHgxOAo+
ICAgICAgICAgICAgICAgICAweDAwMDAwMDAwIDB4MDAwMDNmMDIgMHgwIDB4MiAweDE4PjsKPiB9
Owo+IGBgYAo+IC0tLQo+IHY1LT52NjoKPiBXaWxsIERlYWNvbjoKPiAJLSBkcm9wcGVkIGZpcnN0
IHBhdGNoIGZyb20gdjUgc2VyaWVzIGl0IGhhcyBiZWVuIG1lcmdlZCBpbnRvIG1hc3Rlcgo+IE1h
eXVyZXNoIENoaXRhbGU6Cj4gCS0gZml4ZWQgRldfU0ZFTkNFX1ZNQV9TRU5UIGV2ZW50IGNvZGUK
Pgo+IC0gYWRkZWQgVGVzdGVkLWJ5IHRhZ3MKPiAtLS0KPgo+IE5pa2l0YSBTaHViaW4gKDMpOgo+
ICAgcGVyZiBhcmNoIGV2ZW50czogcmlzY3Ygc2JpIGZpcm13YXJlIHN0ZCBldmVudCBmaWxlcwo+
ICAgcGVyZiB2ZW5kb3IgZXZlbnRzIHJpc2N2OiBhZGQgU2lmaXZlIFU3NCBKU09OIGZpbGUKPiAg
IFJJU0MtVjogQWRkZWQgU3ludGFjb3JlIFNDUjcgUE1VIGV2ZW50cwo+Cj4gIHRvb2xzL3BlcmYv
cG11LWV2ZW50cy9hcmNoL3Jpc2N2L21hcGZpbGUuY3N2ICB8ICAxOCArKysKPiAgLi4uL2FyY2gv
cmlzY3YvcmlzY3Ytc2JpLWZpcm13YXJlLmpzb24gICAgICAgIHwgMTM0ICsrKysrKysrKysrKysr
KysrKwo+ICAuLi4vYXJjaC9yaXNjdi9zaWZpdmUvdTc0L2Zpcm13YXJlLmpzb24gICAgICAgfCAg
NjggKysrKysrKysrCj4gIC4uLi9hcmNoL3Jpc2N2L3NpZml2ZS91NzQvaW5zdHJ1Y3Rpb25zLmpz
b24gICB8ICA5MiArKysrKysrKysrKysKPiAgLi4uL2FyY2gvcmlzY3Yvc2lmaXZlL3U3NC9tZW1v
cnkuanNvbiAgICAgICAgIHwgIDMyICsrKysrCj4gIC4uLi9hcmNoL3Jpc2N2L3NpZml2ZS91NzQv
bWljcm9hcmNoLmpzb24gICAgICB8ICA1NyArKysrKysrKwo+ICAuLi4vYXJjaC9yaXNjdi9zeW50
YWNvcmUvc2NyNy9MMURfY2FjaGUuanNvbiAgfCAxMDIgKysrKysrKysrKysrKwo+ICAuLi4vYXJj
aC9yaXNjdi9zeW50YWNvcmUvc2NyNy9MMUlfY2FjaGUuanNvbiAgfCAgNjcgKysrKysrKysrCj4g
IC4uLi9hcmNoL3Jpc2N2L3N5bnRhY29yZS9zY3I3L2V4Y2VwdGlvbnMuanNvbiB8ICA2NyArKysr
KysrKysKPiAgLi4uL2FyY2gvcmlzY3Yvc3ludGFjb3JlL3NjcjcvZXhlY3V0aW9uLmpzb24gIHwg
IDk3ICsrKysrKysrKysrKysKPiAgLi4uL2FyY2gvcmlzY3Yvc3ludGFjb3JlL3NjcjcvZmlybXdh
cmUuanNvbiAgIHwgIDY4ICsrKysrKysrKwo+ICAuLi4vYXJjaC9yaXNjdi9zeW50YWNvcmUvc2Ny
Ny9nZW5lcmFsLmpzb24gICAgfCAgNDcgKysrKysrCj4gIC4uLi9hcmNoL3Jpc2N2L3N5bnRhY29y
ZS9zY3I3L2ludGVycnVwdHMuanNvbiB8ICAzMiArKysrKwo+ICAuLi4vYXJjaC9yaXNjdi9zeW50
YWNvcmUvc2NyNy9wcmVkaWN0aW9uLmpzb24gfCAgNTIgKysrKysrKwo+ICAxNCBmaWxlcyBjaGFu
Z2VkLCA5MzMgaW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgdG9vbHMvcGVyZi9w
bXUtZXZlbnRzL2FyY2gvcmlzY3YvbWFwZmlsZS5jc3YKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHRv
b2xzL3BlcmYvcG11LWV2ZW50cy9hcmNoL3Jpc2N2L3Jpc2N2LXNiaS1maXJtd2FyZS5qc29uCj4g
IGNyZWF0ZSBtb2RlIDEwMDY0NCB0b29scy9wZXJmL3BtdS1ldmVudHMvYXJjaC9yaXNjdi9zaWZp
dmUvdTc0L2Zpcm13YXJlLmpzb24KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHRvb2xzL3BlcmYvcG11
LWV2ZW50cy9hcmNoL3Jpc2N2L3NpZml2ZS91NzQvaW5zdHJ1Y3Rpb25zLmpzb24KPiAgY3JlYXRl
IG1vZGUgMTAwNjQ0IHRvb2xzL3BlcmYvcG11LWV2ZW50cy9hcmNoL3Jpc2N2L3NpZml2ZS91NzQv
bWVtb3J5Lmpzb24KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHRvb2xzL3BlcmYvcG11LWV2ZW50cy9h
cmNoL3Jpc2N2L3NpZml2ZS91NzQvbWljcm9hcmNoLmpzb24KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0
IHRvb2xzL3BlcmYvcG11LWV2ZW50cy9hcmNoL3Jpc2N2L3N5bnRhY29yZS9zY3I3L0wxRF9jYWNo
ZS5qc29uCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCB0b29scy9wZXJmL3BtdS1ldmVudHMvYXJjaC9y
aXNjdi9zeW50YWNvcmUvc2NyNy9MMUlfY2FjaGUuanNvbgo+ICBjcmVhdGUgbW9kZSAxMDA2NDQg
dG9vbHMvcGVyZi9wbXUtZXZlbnRzL2FyY2gvcmlzY3Yvc3ludGFjb3JlL3NjcjcvZXhjZXB0aW9u
cy5qc29uCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCB0b29scy9wZXJmL3BtdS1ldmVudHMvYXJjaC9y
aXNjdi9zeW50YWNvcmUvc2NyNy9leGVjdXRpb24uanNvbgo+ICBjcmVhdGUgbW9kZSAxMDA2NDQg
dG9vbHMvcGVyZi9wbXUtZXZlbnRzL2FyY2gvcmlzY3Yvc3ludGFjb3JlL3NjcjcvZmlybXdhcmUu
anNvbgo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgdG9vbHMvcGVyZi9wbXUtZXZlbnRzL2FyY2gvcmlz
Y3Yvc3ludGFjb3JlL3NjcjcvZ2VuZXJhbC5qc29uCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCB0b29s
cy9wZXJmL3BtdS1ldmVudHMvYXJjaC9yaXNjdi9zeW50YWNvcmUvc2NyNy9pbnRlcnJ1cHRzLmpz
b24KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHRvb2xzL3BlcmYvcG11LWV2ZW50cy9hcmNoL3Jpc2N2
L3N5bnRhY29yZS9zY3I3L3ByZWRpY3Rpb24uanNvbgoKQWNrZWQtYnk6IFBhbG1lciBEYWJiZWx0
IDxwYWxtZXJAcml2b3NpbmMuY29tPgoKbm90IHN1cmUgaWYgeW91J3JlIGxvb2tpbmcgZm9yIHRo
aXMgdmlhIHRoZSBSSVNDLVYgdHJlZSwgaXQgbG9va3MgbGlrZSAKdXN1YWxseSB0aGVzZSBnZXQg
bWVyZ2VkIHZpYSBhIHBlcmYgdHJlZT8gIFRoYXQncyBPSyB3aXRoIG1lLCBidXQgSSdtIAphbHNv
IE9LIHRha2luZyB0aGVtIHRocm91Z2ggdGhlIFJJU0MtViB0cmVlLiAgTm90ZSB0aGF0IGNwdWlu
Zm8gCmRlcGVuZGVuY3kgc2VlbXMgdG8gYmUgdHJpZ2dlcmluZyBrYXNhbiBmYWlsdXJlcywgc28g
d2UnbGwgYXQgbGVhc3QgbmVlZCAKdG8gc29ydCB0aGF0IG91dC4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
