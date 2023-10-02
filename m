Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75B61E776CE
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Oct 2023 22:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lt8wkiC5FVxlhxGE79RdvccHplwAyMkTbWAgDucKoi8=; b=L+kcfJ4sF6ZtbI
	2j1n+dnuvEnFereM6LORrEUqTDd8AVqYzMj1IJ3OQFQrgnoFTEGVSftenwthiu6seL8hwbcRKJaGF
	O/QbnvIXfuEGUpjnOnd4TNr6LoFDs5ENgnX98j03CxKfTMMyWY90UlSfSix7NTXXhBi6ITYztKlgq
	n0Qb08XlTeH5L2YveUmqr8ataycxnd5Pc/X3ywVnQjT5MBUvrbUGMB/8HiUeuqOQpOD619cfQrJgn
	VOMyQgHaq05Z7vH0IjiaVb5n8NjPmFil1k6UFCQIIzvv9zZD97oT1hotGmHn5D+7VNT0k1PCgTSim
	ah9K8vZwp9zZGJM+5JwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnRJt-00DSGb-2O;
	Mon, 02 Oct 2023 22:23:17 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnRJp-00DSFh-34
	for linux-riscv@lists.infradead.org;
	Mon, 02 Oct 2023 22:23:15 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-40566f8a093so2661835e9.3
        for <linux-riscv@lists.infradead.org>; Mon, 02 Oct 2023 15:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user; t=1696285390; x=1696890190; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5fCiH9a5W/fqJ38SwmAjZfsGQXwRLcdeZgKgDR4wEc4=;
        b=faDl/eD2x/MoOCCg4tzES1vr9tEwxoKz9pqLPBNSbhR0RFO6QqCh41KEEZFSxWlpD7
         DZoHR95ru/8q5uhi2fppqXKb9phi+EEHwbVrp7X78C2r6E0F+zjvvb4Zizpm1hU8T6iu
         g+nWvoA8vv42ZSrNRlaln73ertkwalenC+oGrTzyD64o7IZ7ENKVL83Ex0a5W+HfPHsk
         JpISyvSEhR7jlZnRY4pnhVQjm5Uo3n7Gmw71+fkfEfi6OJy4vVoZYTqiLJUYtByn428k
         99cLJIQxuUaPlCbqfflziorBGMy/E/XQaM1KT/9X5PsBgsspSpnYMYTKl9REwaCajV+/
         7gIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696285390; x=1696890190;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5fCiH9a5W/fqJ38SwmAjZfsGQXwRLcdeZgKgDR4wEc4=;
        b=sENvjO4tl32QHy94nfXPzHn2Rx3tCOPfSfvvMNa5vCG8FWnJsPrxot6+qbTJjuiSfO
         yARiHHo7fjM58xH3rC5QNYMxF8q9aZSeNJTNKJuGKEb23K1lIspuvP+25ZovsOZ0FiGz
         Nlvj8z7CmzGSQPIwVrUkJy8ly0kk6lmN/W2qu4dHHK/Hl9IJXi/b1XcIZlBRCBXeQQDG
         XDHcNjaRc90REt3xCQUmuhl/SnInYcnrCfBIvhNRIxTcGwppQ/++CvEynwhWIbIsbbyS
         JgZfGO2+hN2lrBrbWRRfAwmKTLF6+iJiOlVhX34AlHWBwRcZgUNZ7dySY5sASv/gKtlU
         ep5Q==
X-Gm-Message-State: AOJu0YyoSauHWzObYsaQwOPZ7Y2RkGVJ+r5SxyNoyTcSlYay5m5Vg/ap
	rBUQmFMPSKs8kDi1uAr6cf9P6w==
X-Google-Smtp-Source: AGHT+IF0+hsZ77J1FUzLRT2PMI9V2R5c1nXxGrMA9Nc9wPd3CzAgHdKCKNewknKvF/5TrzCPMoWkOA==
X-Received: by 2002:a05:600c:1c11:b0:406:592b:e5aa with SMTP id j17-20020a05600c1c1100b00406592be5aamr9328015wms.14.1696285389514;
        Mon, 02 Oct 2023 15:23:09 -0700 (PDT)
Received: from smtpclient.apple ([131.111.5.246])
        by smtp.gmail.com with ESMTPSA id n7-20020adff087000000b0031c6e1ea4c7sm11760280wro.90.2023.10.02.15.23.08
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 02 Oct 2023 15:23:09 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.600.7\))
Subject: Re: [PATCH 0/7] Add support to handle misaligned accesses in S-mode
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <CAP6exYLtQuyqMgG6jRAhizp-52ebu3OLNSXe8a8xvLALYFD3kA@mail.gmail.com>
Date: Mon, 2 Oct 2023 23:22:58 +0100
Cc: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>,
 Conor Dooley <conor@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Atish Patra <atishp@rivosinc.com>,
 Andrew Jones <ajones@ventanamicro.com>,
 Evan Green <evan@rivosinc.com>,
 =?utf-8?Q?Bj=C3=B6rn_Topel?= <bjorn@rivosinc.com>,
 linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Daniel Maslowski <cyrevolt@googlemail.com>
Message-Id: <FF617BC9-0FE4-4468-8FF9-06BD8A8115E2@jrtc27.com>
References: <20230926150316.1129648-1-cleger@rivosinc.com>
 <20230930-patchy-curdle-ef5ee6e1a17c@spud>
 <8ce6cd97-6d63-4174-a290-40690c81e205@rivosinc.com>
 <20231002-spearman-doze-70cc026ac13e@spud>
 <693e6584-1e66-48c0-aa7c-61d9f88abd4c@rivosinc.com>
 <CAP6exYLtQuyqMgG6jRAhizp-52ebu3OLNSXe8a8xvLALYFD3kA@mail.gmail.com>
To: ron minnich <rminnich@gmail.com>
X-Mailer: Apple Mail (2.3731.600.7)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_152314_057958_99A617D8 
X-CRM114-Status: GOOD (  30.18  )
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

T24gMiBPY3QgMjAyMywgYXQgMTY6MzIsIHJvbiBtaW5uaWNoIDxybWlubmljaEBnbWFpbC5jb20+
IHdyb3RlOgo+IAo+IFRoaXMgd2FzIGEgdmVyeSBpbnRlcmVzdGluZyByZWFkLiBPbmUgb3RoZXIg
dGhvdWdodCBjcm9zc2VkIG15IG1pbmQsCj4gd2hpY2ggaXMgdGhhdCBhIFJJU0MtViBpbXBsZW1l
bnRhdGlvbiBtaWdodCBtYWtlIHRoZSBhbGlnbm1lbnQKPiBkZWxlZ2F0aW9uIGhhcmQtd2lyZWQg
dG8gYWx3YXlzIGRlbGVnYXRlIHRvIFMgbW9kZS4gSS5lLCB0aGUgYml0IG1pZ2h0Cj4gYmUgV0FS
TCBhbmQgYWx3YXlzIDEuIEZvciB3aGF0IEknbSBkb2luZywgdGhpcyB3b3VsZCBhY3R1YWxseSBi
ZQo+IHByZXR0eSBjb252ZW5pZW50LiBKdXN0IHdhbnQgdG8gbWFrZSBzdXJlIHRoaXMgY29kZSBj
YW4gYWNjb21tb2RhdGUKPiB0aGF0IC0tIHdkeXQ/CgpTdWNoIGFuIGltcGxlbWVudGF0aW9uIHdv
dWxkIHZpb2xhdGUgdGhlIHNwZWM6CgogIEFuIGltcGxlbWVudGF0aW9uIHNoYWxsIG5vdCBoYXZl
IGFueSBiaXRzIG9mIG1lZGVsZWcgYmUgcmVhZC1vbmx5CiAgb25lLCBpLmUuLCBhbnkgc3luY2hy
b25vdXMgdHJhcCB0aGF0IGNhbiBiZSBkZWxlZ2F0ZWQgbXVzdCBzdXBwb3J0IG5vdAogIGJlaW5n
IGRlbGVnYXRlZC4KClN1cHBvcnRpbmcgdGhhdCBpcyB0aHVzIG91dCBvZiBzY29wZS4KCkplc3MK
Cj4gV2UgaGF2ZSBmb3VuZCBsb3RzIG9mIHZhbHVlIGluIG91ciBleHBlcmltZW50cyB3aXRoIGRl
bGVnYXRpbmcKPiBhbGlnbm1lbnQgdHJhcHMgdG8gTGludXggLS0gbm90IGxlYXN0IGJlY2F1c2Ug
dGhleSB0ZW5kIHRvIGxvY2F0ZQo+IHByb2JsZW1zIGluIHRoZSBrZXJuZWwgOi0pIC0tIHdlJ3Zl
IGZvdW5kIGlzc3VlcyBpbiBtb2R1bGUgbG9hZGluZywKPiBlYXJseSBzdGFydHVwICh0aGVyZSdz
IGEgbmVlZGVkIC5hbGlnbjIgZGlyZWN0aXZlIGZvciBzYmkgc2Vjb25kYXJ5Cj4gc3RhcnR1cCwg
QUZBSUNUKSBhbmQgdGhlIHRpbWluZyBjb2RlIGZvciBtaXNhbGlnbmVkIGxvYWQvc3RvcmUKPiBo
YW5kbGluZy4KPiAKPiBJIGRvbid0IGtub3cgaG93IHlvdSB0ZXN0IHRoaXMgdW5hbGlnbmVkIHRy
YXAgaGFuZGxpbmcsIGJ1dCBpdCBtaWdodAo+IGJlIHdvcnRod2hpbGUgdG8gd29yayB0aGF0IG91
dC4gWW91IGNhbiB0ZXN0IHZpYSBvcmVib290IGFuZCB0aGUKPiB2aXNpb25maXZlMiwgc2F2ZSB3
ZSBoYXZlIG5vdCBmaWd1cmVkIG91dCB3aHkgU01QIHN0YXJ0dXAgaXMgZ29pbmcKPiB3cm9uZywg
eWV0IDotKSwgc28gd2UncmUgbm90IGFzIGZlYXR1cmUtY29tcGxldGUgYXMgbmVlZGVkLiBCdXQg
c29vbi4KPiAKPiBUaGFua3MhCj4gCj4gT24gTW9uLCBPY3QgMiwgMjAyMyBhdCA1OjE54oCvQU0g
Q2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPiB3cm90ZToKPj4gCj4+IAo+PiAK
Pj4gT24gMDIvMTAvMjAyMyAxMjo0OSwgQ29ub3IgRG9vbGV5IHdyb3RlOgo+Pj4gT24gTW9uLCBP
Y3QgMDIsIDIwMjMgYXQgMDk6NDA6MDRBTSArMDIwMCwgQ2zDqW1lbnQgTMOpZ2VyIHdyb3RlOgo+
Pj4+IAo+Pj4+IAo+Pj4+IE9uIDMwLzA5LzIwMjMgMTE6MjMsIENvbm9yIERvb2xleSB3cm90ZToK
Pj4+Pj4gT24gVHVlLCBTZXAgMjYsIDIwMjMgYXQgMDU6MDM6MDlQTSArMDIwMCwgQ2zDqW1lbnQg
TMOpZ2VyIHdyb3RlOgo+Pj4+Pj4gU2luY2UgY29tbWl0IDYxY2FkYjkgKCJQcm92aWRlIG5ldyBk
ZXNjcmlwdGlvbiBvZiBtaXNhbGlnbmVkIGxvYWQvc3RvcmUKPj4+Pj4+IGJlaGF2aW9yIGNvbXBh
dGlibGUgd2l0aCBwcml2aWxlZ2VkIGFyY2hpdGVjdHVyZS4iKSBpbiB0aGUgUklTQy1WIElTQQo+
Pj4+Pj4gbWFudWFsLCBpdCBpcyBzdGF0ZWQgdGhhdCBtaXNhbGlnbmVkIGxvYWQvc3RvcmUgbWln
aHQgbm90IGJlIHN1cHBvcnRlZC4KPj4+Pj4+IEhvd2V2ZXIsIHRoZSBSSVNDLVYga2VybmVsIHVB
QkkgZGVzY3JpYmVzIHRoYXQgbWlzYWxpZ25lZCBhY2Nlc3NlcyBhcmUKPj4+Pj4+IHN1cHBvcnRl
ZC4gSW4gb3JkZXIgdG8gc3VwcG9ydCB0aGF0LCB0aGlzIHNlcmllcyBhZGRzIHN1cHBvcnQgZm9y
IFMtbW9kZQo+Pj4+Pj4gaGFuZGxpbmcgb2YgbWlzYWxpZ25lZCBhY2Nlc3NlcyBhcyB3ZWxsIHN1
cHBvcnQgZm9yIHByY3RsKFBSX1VOQUxJR04pLgo+Pj4+Pj4gCj4+Pj4+PiBIYW5kbGluZyBtaXNh
bGlnbmVkIGFjY2VzcyBpbiBrZXJuZWwgYWxsb3dzIGZvciBhIGZpbmVyIGdyYWluIGNvbnRyb2wK
Pj4+Pj4+IG9mIHRoZSBtaXNhbGlnbmVkIGFjY2Vzc2VzIGJlaGF2aW9yLCBhbmQgdGhhbmtzIHRv
IHRoZSBwcmN0bCBjYWxsLCBjYW4KPj4+Pj4+IGFsbG93IGRpc2FibGluZyBtaXNhbGlnbmVkIGFj
Y2VzcyBlbXVsYXRpb24gdG8gZ2VuZXJhdGUgU0lHQlVTLiBVc2VyCj4+Pj4+PiBzcGFjZSBjYW4g
dGhlbiBvcHRpbWl6ZSBpdHMgc29mdHdhcmUgYnkgcmVtb3Zpbmcgc3VjaCBhY2Nlc3MgYmFzZWQg
b24KPj4+Pj4+IFNJR0JVUyBnZW5lcmF0aW9uLgo+Pj4+Pj4gCj4+Pj4+PiBDdXJyZW50bHksIHRo
aXMgc2VyaWVzIGlzIHVzZWZ1bCBmb3IgcGVvcGxlIHRoYXQgdXNlcyBhIFNCSSB0aGF0IGRvZXMK
Pj4+Pj4+IG5vdCBoYW5kbGVkIG1pc2FsaWduZWQgdHJhcHMuIEluIGEgbmVhciBmdXR1cmUsIHRo
aXMgc2VyaWVzIHdpbGwgbWFrZQo+Pj4+Pj4gdXNlIGEgU0JJIGV4dGVuc2lvbiBbMV0gYWxsb3dp
bmcgdG8gcmVxdWVzdCBkZWxlZ2F0aW9uIG9mIHRoZQo+Pj4+Pj4gbWlzYWxpZ25lZCBsb2FkL3N0
b3JlIHRyYXBzIHRvIHRoZSBTLW1vZGUgc29mdHdhcmUuIFRoaXMgZXh0ZW5zaW9uIGhhcwo+Pj4+
Pj4gYmVlbiBzdWJtaXR0ZWQgZm9yIHJldmlldyB0byB0aGUgcmlzY3YgdGVjaC1wcnMgZ3JvdXAu
IEFuIE9wZW5TQkkKPj4+Pj4+IGltcGxlbWVudGF0aW9uIGZvciB0aGlzIHNwZWMgaXMgYXZhaWxh
YmxlIGF0IFsyXS4KPj4+Pj4+IAo+Pj4+Pj4gVGhpcyBzZXJpZXMgY2FuIGJlIHRlc3RlZCB1c2lu
ZyB0aGUgc3Bpa2Ugc2ltdWxhdG9yIFszXSBhbmQgYW4gb3BlblNCSQo+Pj4+Pj4gdmVyc2lvbiBb
NF0gd2hpY2ggYWxsb3dzIHRvIGFsd2F5cyBkZWxlZ2F0ZSBtaXNhbGlnbmVkIGxvYWQvc3RvcmUg
dG8KPj4+Pj4+IFMtbW9kZS4KPj4+Pj4gCj4+Pj4+IFNvbWUgcGF0Y2hlcyBpbiB0aGlzIHNlcmll
cyBkbyBub3QgYnVpbGQgZm9yIGFueSBjb25maWdzLCBzb21lIGFyZQo+Pj4+PiBicm9rZW4gZm9y
IGNsYW5nIGJ1aWxkcyBhbmQgb3RoZXJzIGFyZSBicm9rZW4gZm9yIG5vbW11LiBQbGVhc2UgdHJ5
IHRvPiBidWlsZCB0ZXN0IHRoaXMgbW9yZSB0aG9yb3VnaGx5IGJlZm9yZSB5b3Ugc3VibWl0IHRo
ZSBuZXh0IHZlcnNpb24uCj4+Pj4gCj4+Pj4gSGkgQ29ub3IsCj4+Pj4gCj4+Pj4gVGhhbmtzIGZv
ciB0aGUgZmVlZGJhY2ssIEknbGwgY2hlY2sgdGhhdC4KPj4+PiAKPj4+Pj4gCj4+Pj4+IEFsc28s
IEFJVUksIHRoaXMgc2VyaWVzIHNob3VsZCBiZSBtYXJrZWQgUkZDIHNpbmNlIHRoZSBTQkkgZXh0
ZW5zaW9uCj4+Pj4+IHRoaXMgcmVsaWVzIG9uIGhhcyBub3QgYmVlbiBmcm96ZW4uCj4+Pj4gCj4+
Pj4gVGhpcyBzZXJpZXMgZG9lcyBub3QgYWN0dWFsbHkgdXNlcyB0aGUgU0JJIGV4dGVuc2lvbiBi
dXQgcHJvdmlkZXMgYSB3YXkKPj4+PiB0byBkZXRlY3QgaWYgbWlzYWxpZ25lZCBhY2Nlc3NlcyBh
cmUgbm90IGhhbmRsZWQgYnkgaGFyZHdhcmUgbm9yIGJ5IHRoZQo+Pj4+IFNCSS4gSXQgaGFzIGJl
ZW4gcmVwb3J0ZWQgYnkgUm9uICYgRGFuaWVsIHRoZXkgdGhleSBoYXZlIGEgbWluaW1hbCBTQkkK
Pj4+PiBpbXBsZW1lbnRhdGlvbiB0aGF0IGRvZXMgbm90IGhhbmRsZSBtaXNhbGlnbmVkIGFjY2Vz
c2VzIGFuZCB0aGF0IHRoZXkKPj4+PiB3b3VsZCBsaWtlIHRvIG1ha2UgdXNlIG9mIHRoZSBQUl9T
RVRfVU5BTElHTiBmZWF0dXJlLiBUaGlzIGlzIHdoYXQgdGhpcwo+Pj4+IHNlcmllcyBhZGRyZXNz
ZXMgKGFuZCB0aHVzIGRvZXMgbm90IGRlcGVuZCBvbiB0aGUgbWVudGlvbmVkIFNCSSBleHRlbnNp
b24pLgo+Pj4gCj4+PiBBaCwgSSBtdXN0IGhhdmUgbWlzcmVhZCB0aGVuLiBBcG9sb2dpZXMuCj4+
IAo+PiBObyB3b3JyaWVzLCBtYXliZSBJIHNob3VsZCBhY3R1YWxseSByZW1vdmUgdGhpcyBmcm9t
IHRoZSBjb3ZlciBsZXR0ZXIgdG8KPj4gYXZvaWQgYW55IGNvbmZ1c2lvbiAhCj4+IAo+PiBDbMOp
bWVudAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Cj4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
