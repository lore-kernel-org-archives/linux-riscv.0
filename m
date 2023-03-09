Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BBB1C678D5
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Mar 2023 02:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9Unv9LnzBXU2WQDAe56xGE6tAJ5LjtY51eSFq33ln7c=; b=GfsBULeNinRXzv
	lum1HiFQMdXfuC9clK44YeaJjvEitSVn5qoYRa9A+WVk/YNEdSYFu2O1Ogoe4zSvEIw37AsKa+abr
	4/Cqrtzsv488A2iktcBsaqf5duCKJuYFdQE0Rxw2cTA3zbto5f7R18NY0vYbq2A1mht3xJMgzYJyD
	v5xGvDw6w4E85xQ63iQrbKCZLWwrT5evkJbg8OZLBIBFLXIkdOwNgHyfZlGruMAdYG4+2QSgRKIum
	lHVK+Gh4TwaaLWiD9e/rzayX/QgZ+Yx7nnrMJCH4t5XLD8ADkcVxYLSqDDAXRuJnRThGSnusJPjK9
	DB+2TmIEOKvFoygAiufQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pa5sp-007Vde-Pq; Thu, 09 Mar 2023 02:19:55 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pa5sm-007VbE-0d
	for linux-riscv@lists.infradead.org; Thu, 09 Mar 2023 02:19:54 +0000
Received: by mail-wm1-x331.google.com with SMTP id bg16-20020a05600c3c9000b003eb34e21bdfso2606263wmb.0
        for <linux-riscv@lists.infradead.org>; Wed, 08 Mar 2023 18:19:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user; t=1678328380;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3ssPfoh9aqr53T59+LRlDc4FDNkN5/Uw0DxcwgjrF2A=;
        b=mrEx/DI9y6SuARRxHg0TWCr9xyZ5EHshcCAC7fWyfGR751kdIgZu6xpTKzEM6iB58t
         49QJLYhNtyRt1cLGbKt3xPtYINfDDHUVl2N/fUu1ma6uxihgvWZ5bArlujcbF6KQN/mG
         X9ec8xotxiMIWBIMDle39GzM/HcmMagt9QllkbiuugD4SIjdQJRV0yJwm9bfaFoaV8WL
         Clmni7G09coDwxJEQVTNRxLHOrS+462tQz8wasU+As/+od9fcG+dIrDgOQC8oomvyF+H
         ngyBCc14x8spGdbwp+zIcu7gUTfIk/l1o6PJk9ITir368zBpwBYTYaV4PGb9ALO8Ozm1
         GXiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678328380;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3ssPfoh9aqr53T59+LRlDc4FDNkN5/Uw0DxcwgjrF2A=;
        b=iJwvxB9zryh4Ai43v+ne9kGHHp/hT382zZcXyqEV+kDnHAg/P3ylPnHrCay2zrAIlr
         9BQamVNdxlvDDKB50Sc9XcUxDEe5VvIm+COXk4PL2RABScAaPZgpnobxI5vm3lkvizwS
         5AxBHXyfPv8aQA6fVw3E/JcaqyUEptySKKXunG697sUiFwuYySR++d5Fx22ESklCVBtA
         5nz7OBZR5259vMWZoWeok45QGGLMXz8fnYMMSdCO7mzRlYSxU/lqza9QVxUwNr+y9o1I
         lBFzvaYMXiBMm2lQHTLdd+YEg04mcB2C1iAuZyWFMAb3G1+ZhweWx4+ckyYULZFRjPHF
         ABJQ==
X-Gm-Message-State: AO0yUKXl1+p3zk1e1SjT/q4dYDfcDSrJN5jCWEoQkxFI6Jh6QnSXzNrB
	p9gPaoTpwPGdYCeXpSv3ak/rhQ==
X-Google-Smtp-Source: AK7set/qpwLIYtzLqCl59j2ELXMrW+oEX2ZpU/wP0+5us2l9Mvk/5wRTP/iLRhg5kFrSxvsMg74q1A==
X-Received: by 2002:a05:600c:1d09:b0:3eb:3945:d3f4 with SMTP id l9-20020a05600c1d0900b003eb3945d3f4mr19026392wms.2.1678328379992;
        Wed, 08 Mar 2023 18:19:39 -0800 (PST)
Received: from smtpclient.apple (global-5-144.n-2.net.cam.ac.uk. [131.111.5.144])
        by smtp.gmail.com with ESMTPSA id m14-20020a05600c4f4e00b003e22508a343sm1097470wmq.12.2023.03.08.18.19.39
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 08 Mar 2023 18:19:39 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [PATCH v2] RISC-V: remove I-extension ISA spec version dance
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <20230308220842.1231003-1-conor@kernel.org>
Date: Thu, 9 Mar 2023 02:19:38 +0000
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Nathan Chancellor <nathan@kernel.org>,
 naresh.kamboju@linaro.org,
 llvm@lists.linux.dev,
 stable@vger.kernel.org,
 aurelien@aurel32.net,
 ndesaulniers@google.com,
 Palmer Dabbelt <palmer@rivosinc.com>
Message-Id: <3476D6EF-F7DD-4437-A71C-47EF05210AF3@jrtc27.com>
References: <20230308220842.1231003-1-conor@kernel.org>
To: Conor Dooley <conor@kernel.org>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_181952_154582_79FFAD76 
X-CRM114-Status: GOOD (  31.90  )
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

T24gOCBNYXIgMjAyMywgYXQgMjI6MDgsIENvbm9yIERvb2xleSA8Y29ub3JAa2VybmVsLm9yZz4g
d3JvdGU6Cj4gCj4gRnJvbTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNv
bT4KPiAKPiBUaGUgc3BlYyBmb2xrLCBpbiB0aGVpciBpbmZpbml0ZSB3aXNkb20sIG1vdmVkIGJv
dGggY29udHJvbCBhbmQgc3RhdHVzCj4gcmVnaXN0ZXJzICYgdGhlIEZFTkNFLkkgaW5zdHJ1Y3Rp
b25zIG91dCBvZiB0aGUgSSBleHRlbnNpb24gaW50byB0aGVpcgo+IG93biBleHRlbnNpb25zICha
aWNzciwgWmlmZW5jZWkpIGluIHRoZSAyMDE5MDYwOCB2ZXJzaW9uIG9mIHRoZSBJU0EKPiBzcGVj
IFswXS4KPiBUaGUgR0NDL2JpbnV0aWxzIGNyZXcgZGVjaWRlZCBbMV0gdG8gbW92ZSB0aGVpciBk
ZWZhdWx0IHZlcnNpb24gb2YgdGhlCj4gSVNBIHNwZWMgdG8gdGhlIDIwMTkxMjEzIHZlcnNpb24g
b2YgdGhlIElTQSBzcGVjLCB3aGljaCBjYW1lIGludG8gYmVpbmcKPiBmb3IgdmVyc2lvbiAyLjM4
IG9mIGJpbnV0aWxzIGFuZCBHQ0MgMTIuIEJ1aWxkaW5nIHdpdGggdGhpcyB0b29sY2hhaW4KPiBj
b25maWd1cmF0aW9uIHdvdWxkIHJlc3VsdCBpbiBhc3NlbWJsZXIgaXNzdWVzOgo+ICBDQyAgICAg
IGFyY2gvcmlzY3Yva2VybmVsL3Zkc28vdmdldHRpbWVvZmRheS5vCj4gIDw8QlVJTERESVI+Pi9h
cmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Zkc28vZ2V0dGltZW9mZGF5Lmg6IEFzc2VtYmxlciBtZXNz
YWdlczoKPiAgPDxCVUlMRERJUj4+L2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vdmRzby9nZXR0aW1l
b2ZkYXkuaDo3MTogRXJyb3I6IHVucmVjb2duaXplZCBvcGNvZGUgYGNzcnIgYTUsMHhjMDEnCj4g
IDw8QlVJTERESVI+Pi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Zkc28vZ2V0dGltZW9mZGF5Lmg6
NzE6IEVycm9yOiB1bnJlY29nbml6ZWQgb3Bjb2RlIGBjc3JyIGE1LDB4YzAxJwo+ICA8PEJVSUxE
RElSPj4vYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS92ZHNvL2dldHRpbWVvZmRheS5oOjcxOiBFcnJv
cjogdW5yZWNvZ25pemVkIG9wY29kZSBgY3NyciBhNSwweGMwMScKPiAgPDxCVUlMRERJUj4+L2Fy
Y2gvcmlzY3YvaW5jbHVkZS9hc20vdmRzby9nZXR0aW1lb2ZkYXkuaDo3MTogRXJyb3I6IHVucmVj
b2duaXplZCBvcGNvZGUgYGNzcnIgYTUsMHhjMDEnCj4gVGhpcyB3YXMgZml4ZWQgaW4gY29tbWl0
IDZkZjJhMDE2YzBjOCAoInJpc2N2OiBmaXggYnVpbGQgd2l0aCBiaW51dGlscwo+IDIuMzgiKSBi
eSBBdXJlbGllbiBKYXJubywgYnV0IGhhcyBwcm92ZW4gZnJhZ2lsZS4KPiAKPiBCZWZvcmUgTExW
TSAxNywgTExWTSBkaWQgbm90IHN1cHBvcnQgdGhlc2UgZXh0ZW5zaW9ucyBhbmQsIGFzIHN1Y2gs
IHRoZQo+IGNjLW9wdGlvbiBjaGVjayBhZGRlZCBieSBBdXJlbGllbiB3b3JrZWQuIFNpbmNlIGNv
bW1pdCAyMmUxOTllNmFmYjEKPiAoIltSSVNDVl0gQWNjZXB0IHppY3NyIGFuZCB6aWZlbmNlaSBj
b21tYW5kIGxpbmUgb3B0aW9ucyIpIGhvd2V2ZXIsIExMVk0KPiAqZG9lcyogc3VwcG9ydCB0aGVt
IGFuZCB0aGUgY2Mtb3B0aW9uIGNoZWNrIHBhc3Nlcy4KPiAKPiBUaGlzIHN1cmZhY2VkIGFzIGEg
cHJvYmxlbSB3aGlsZSBidWlsZGluZyB0aGUgNS4xMCBzdGFibGUga2VybmVsIHVzaW5nCj4gdGhl
IGRlZmF1bHQgVHV4bWFrZSBEZWJpYW4gaW1hZ2UgWzJdLCBhcyA1LjEwIGRpZCBub3QgeWV0IHN1
cHBvcnQgbGQubGxkLAo+IGFuZCB1c2VzIHRoZSBEZWJpYW4gcHJvdmlkZWQgYmludXRpbHMgMi4z
NS4KPiBWZXJzaW9ucyBvZiBsZCBwcmlvciB0byAyLjM4IHdpbGwgcmVmdXNlIHRvIGxpbmsgaWYg
dGhleSBlbmNvdW50ZXIKPiB1bmtub3duIElTQSBleHRlbnNpb25zLCBhbmQgdW5mb3J0dW5hdGVs
eSBaaWZlbmNlaSBpcyBub3Qgc3VwcG9ydGVkIGJ5Cj4gYmludHVpbHMgMi4zNS4KPiAKPiBJbnN0
ZWFkIG9mIGRhbmNpbmcgYXJvdW5kIHdpdGggYWRkaW5nIHRoZXNlIGV4dGVuc2lvbnMgdG8gbWFy
Y2gsIGFzIHdlCj4gY3VycmVudGx5IGRvLCBQYWxtZXIgc3VnZ2VzdGVkIGxvY2tpbmcgR0NDIGJ1
aWxkcyB0byB0aGUgc2FtZSB2ZXJzaW9uIG9mCj4gdGhlIElTQSBzcGVjIHRoYXQgaXMgdXNlZCBi
eSBMTFZNLiBBcyBmYXIgYXMgSSBjYW4gdGVsbCwgdGhhdCBpcyAyLjIsCj4gd2l0aCwgYXBwYXJl
bnRseSBbM10sIGEgbGFjayBvZiBpbnRlcmVzdCBpbiBpbXBsZW1lbnRpbmcgYSBmbGFnIGxpa2UK
PiBHQ0MncyAtbWlzYS1zcGVjIGF0IHByZXNlbnQuCj4gCj4gQWRkIHtjYyxhc30tb3B0aW9uIGNo
ZWNrcyB0byBhZGQgLW1pc2Etc3BlYyB0byBLQlVJTERfe0EsQ31GTEFHUyB3aGVuCj4gR0NDIGlz
IHVzZWQgJiByZW1vdmUgdGhlIG1hcmNoIGRhbmNlLgo+IAo+IEFzIGNsYW5nIGRvZXMgbm90IGFj
Y2VwdCB0aGlzIGFyZ3VtZW50LCBJIGhhZCBleHBlY3RlZCB0byBlbmNvdW50ZXIKPiBpc3N1ZXMg
d2l0aCB0aGUgYXNzZW1ibGVyLCBhcyBuZWl0aGVyIHppY3NyIG5vciB6aWZlbmNlaSBhcmUgcHJl
c2VudCBpbgo+IHRoZSBJU0Egc3RyaW5nIGFuZCB0aGUgc3BlYyB2ZXJzaW9uICpzaG91bGQqIGJl
IGRlZmF1bHRpbmcgdG8gYSB2ZXJzaW9uCj4gdGhhdCByZXF1aXJlcyB0aGVtIHRvIGJlIHByZXNl
bnQuIFRoZSBidWlsZCBwYXNzZWQgaG93ZXZlciBhbmQgdGhlCj4gcmVzdWx0aW5nIGtlcm5lbCB3
b3JrZWQgcGVyZmVjdGx5IGZpbmUgZm9yIG1lIG9uIGEgUG9sYXJGaXJlIFNvQy4uLgoKRm9yIHdo
YXQgaXTigJlzIHdvcnRoLCBMTFZNIGlzIGxpa2VseSB0byBtb3ZlIGZyb20gb25seSBzdXBwb3J0
aW5nIHRoZQpvbGQgcmF0aWZpZWQgc3BlYyB0byBvbmx5IHN1cHBvcnRpbmcgdGhlIGxhdGVzdCBv
bmUsIHdpdGggbm8gdWdseQotbWlzYS1zcGVjIGxpa2UgdGhlIEdOVSB3b3JsZC4gWW91IG1heSB0
aGVyZWZvcmUgd2lzaCB0byByZWNvbnNpZGVyCnRoaXMuLi4KCkplc3MKCj4gTGluazogaHR0cHM6
Ly9yaXNjdi5vcmcvd3AtY29udGVudC91cGxvYWRzLzIwMTkvMDYvcmlzY3Ytc3BlYy5wZGYgWzBd
Cj4gTGluazogaHR0cHM6Ly9ncm91cHMuZ29vZ2xlLmNvbS9hL2dyb3Vwcy5yaXNjdi5vcmcvZy9z
dy1kZXYvYy9hRTFaZUhIQ1lmNCBbMV0KPiBMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9h
bGwvQ0ErRzlmWXQ5VD1FTENMYUI5Ynl4YUxXMlFmNHBaY0RPPWh1Q0EwRDh1ZzJWMitpckpRQG1h
aWwuZ21haWwuY29tLyBbMl0KPiBMaW5rOiBodHRwczovL2Rpc2NvdXJzZS5sbHZtLm9yZy90L3Nw
ZWNpZnlpbmctdW5wcml2aWxlZGdlLXNwZWMtdmVyc2lvbi1taXNhLXNwZWMtZ2NjLWZsYWctZXF1
aXZhbGVudC82NjkzNSBbM10KPiBDQzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwo+IFN1Z2dlc3Rl
ZC1ieTogUGFsbWVyIERhYmJlbHQgPHBhbG1lckByaXZvc2luYy5jb20+Cj4gUmVwb3J0ZWQtYnk6
IE5hcmVzaCBLYW1ib2p1IDxuYXJlc2gua2FtYm9qdUBsaW5hcm8ub3JnPgo+IFNpZ25lZC1vZmYt
Ynk6IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+Cj4gLS0tCj4gSSB0
aGluayBBdXJlbGllbidzIG9yaWdpbmFsIGNvbW1pdCBtZXNzYWdlIG1pZ2h0IGFjdHVhbGx5IG5v
dCBiZSBxdWl0ZQo+IGNvcnJlY3Q/IEkgZm91bmQsIGluIG15IGxpbWl0ZWQgdGVzdGluZywgdGhh
dCBpdCBpcyBub3QgdGhlIGRlZmF1bHQKPiBiZWhhdmlvdXIgb2YgZ2FzIHRoYXQgbWF0dGVycywg
YnV0IHJhdGhlciB0aGUgdG9vbGNoYWluIGl0c2VsZj8KPiBNeSBiaW51dGlscyB2ZXJzaW9ucyAo
Ym90aCB0aG9zZSBidWlsdCB1c2luZyB0aGUgY2xhbmctYnVpbHQtbGludXgKPiB0Yy1idWlsZCBz
Y3JpcHRzIHdoaWNoIGRvIG5vdCBzZXQgYW4gSVNBIHNwZWMgdmVyc2lvbiwgYW5kIG9uZSBidWls
dAo+IHVzaW5nIHRoZSByaXNjdi1nbnUtdG9vbGNoYWluIGluZnJhIHcvIGFuIGV4cGxpY2l0IDIw
MTkxMjEzIHNwZWMgdmVyc2lvbgo+IHNldCkgZG8gbm90IGVuY291bnRlciB0aGVzZSBpc3N1ZXMu
Cj4gRnJvbSAqbXkqIHRlc3RpbmcsIEkgd2FzIG9ubHkgYWJsZSB0byByZXByb2R1Y2UgdGhlIGFi
b3ZlIGJ1aWxkIGZhaWx1cmVzCj4gYmVjYXVzZSBvZiAqR0NDKiBkZWZhdWx0aW5nIHRvIGEgbmV3
ZXIgSVNBIHNwZWMgdmVyc2lvbiwgYW5kIHNhdyBubwo+IGlzc3VlcyB3aXRoIENDPWNsYW5nIGJ1
aWxkcywgd2hlcmUgLW1pc2Etc3BlYyBpcyBub3QgKEFGQUlDVCkgcGFzc2VkIHRvCj4gZ2FzLgo+
IEknbSBmYXIgZnJvbSBhIHRvb2xjaGFpbiBwZXJzb24sIHNvIEkgYW0gdmVyeSB2ZXJ5IGhhcHB5
IHRvIGhhdmUgdGhlCj4gcmVhc29uIGZvciB0aGF0IGV4cGxhaW5lZCB0byBtZSwgYXMgSSd2ZSBi
ZWVuIHNjcmF0Y2hpbmcgbXkgaGVhZCBhYm91dAo+IGl0IGFsbCBldmVuaW5nLgo+IAo+IEknbSBh
bHNvIG5vdCBzdXBlciBjb25maWRlbnQgaW4gbXkgImFzLW9wdGlvbiJpbmcsIGJ1dCBpdCB3b3Jr
ZWQgZm9yIG1lLAo+IHNvIGl0J3MgZ290dGEgYmUgcGVyZmVjdCwgcmlnaHQ/IHJpaWlnaHQ/Pwo+
IAo+IENoYW5nZXMgZnJvbSB2MToKPiAtIGVudGlyZWx5IG5ldyBhcHByb2FjaCB0byB0aGUgaXNz
dWUKPiAtLS0KPiBhcmNoL3Jpc2N2L01ha2VmaWxlIHwgNiArKy0tLS0KPiAxIGZpbGUgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9hcmNo
L3Jpc2N2L01ha2VmaWxlIGIvYXJjaC9yaXNjdi9NYWtlZmlsZQo+IGluZGV4IDYyMDNjMzM3ODky
Mi4uMmRmN2E1ZGMwNzFjIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvTWFrZWZpbGUKPiArKysg
Yi9hcmNoL3Jpc2N2L01ha2VmaWxlCj4gQEAgLTU3LDEwICs1Nyw4IEBAIHJpc2N2LW1hcmNoLSQo
Q09ORklHX0FSQ0hfUlY2NEkpCTo9IHJ2NjRpbWEKPiByaXNjdi1tYXJjaC0kKENPTkZJR19GUFUp
CQk6PSAkKHJpc2N2LW1hcmNoLXkpZmQKPiByaXNjdi1tYXJjaC0kKENPTkZJR19SSVNDVl9JU0Ff
QykJOj0gJChyaXNjdi1tYXJjaC15KWMKPiAKPiAtIyBOZXdlciBiaW51dGlscyB2ZXJzaW9ucyBk
ZWZhdWx0IHRvIElTQSBzcGVjIHZlcnNpb24gMjAxOTEyMTMgd2hpY2ggbW92ZXMgc29tZQo+IC0j
IGluc3RydWN0aW9ucyBmcm9tIHRoZSBJIGV4dGVuc2lvbiB0byB0aGUgWmljc3IgYW5kIFppZmVu
Y2VpIGV4dGVuc2lvbnMuCj4gLXRvb2xjaGFpbi1uZWVkLXppY3NyLXppZmVuY2VpIDo9ICQoY2Fs
bCBjYy1vcHRpb24teW4sIC1tYXJjaD0kKHJpc2N2LW1hcmNoLXkpX3ppY3NyX3ppZmVuY2VpKQo+
IC1yaXNjdi1tYXJjaC0kKHRvb2xjaGFpbi1uZWVkLXppY3NyLXppZmVuY2VpKSA6PSAkKHJpc2N2
LW1hcmNoLXkpX3ppY3NyX3ppZmVuY2VpCj4gK0tCVUlMRF9DRkxBR1MgKz0gJChjYWxsIGNjLW9w
dGlvbiwtbWlzYS1zcGVjPTIuMikKPiArS0JVSUxEX0FGTEFHUyArPSAkKGNhbGwgYXMtb3B0aW9u
LC1XYSQoY29tbWEpLW1pc2Etc3BlYz0yLjIpCj4gCj4gIyBDaGVjayBpZiB0aGUgdG9vbGNoYWlu
IHN1cHBvcnRzIFppaGludHBhdXNlIGV4dGVuc2lvbgo+IHJpc2N2LW1hcmNoLSQoQ09ORklHX1RP
T0xDSEFJTl9IQVNfWklISU5UUEFVU0UpIDo9ICQocmlzY3YtbWFyY2gteSlfemloaW50cGF1c2UK
PiAtLSAKPiAyLjM5LjIKPiAKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwo+IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+IGxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
