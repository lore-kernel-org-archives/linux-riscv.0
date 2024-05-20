Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F17E2C25B78
	for <linux-riscv@archiver.kernel.org>; Mon, 20 May 2024 20:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aEk7wU24RcwH8/Oi9oCElpDdXSoPMNnWQRBAS92bD+I=; b=QpVg5aPtMyZJf7
	RO7CEHh4Vdc5lu+7+PGtwUWVXdUXE3r2Xd7rSEDlYk+3l0lHeym2R0YFsEgymGZXF+jBX4jU+OxjN
	114FO3xRDeAarSjNsYw/qZ/3sdLwRA+P/jleRu8nxsvD13dNkNOQyBy5QGjmhoahQE+T3pT+rhl5o
	IwMhWwbyyu+d7k3oNg621rVs1HoLcmnt2IDcKY8a9AKsPvyxnmw5iOreA7MhQAfh6NSrUPvLCkReQ
	PxHJHOILwXwSYYrAOTIIaA3K1QVle/1HRLN0dQkGIFlvI9gT2ZjnFy6+dsxBC8Ua1RHn9CcNcD8T7
	wIZPQdvAMgjMepX4WBJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s99MJ-0000000FQxe-3BuH;
	Mon, 20 May 2024 20:11:47 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s99MG-0000000FQwr-3Sbt
	for linux-riscv@lists.infradead.org;
	Mon, 20 May 2024 20:11:46 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1ecd3867556so89665365ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 20 May 2024 13:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1716235903; x=1716840703; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9PM2o5jNXfuRUuP6TxEIEBudbQR4NtCgVAI1O+sTf7U=;
        b=mZgBkM/Zxv2+aBCKU6zWXH0YSm6k6uEVfiZCn5YlnD4KiuaZCfceXyW1QpHHZkdh74
         FsbRfBJmQdYcfhKmZGJofQ7ReMZXwzXuYMX6yeoAKuR7COab3W3aCz1sDImG533WEKAK
         5Z4Lm9eACdSrYcW/Gs/Dr0PthFJBQrst75HL3oB0PJqXs5aunKf9SDKvV+zRtTKlk3LE
         6QIuCsMOK4mvJcTRdgBGNJnMBBPfXbS0PToknOqZPU/t6QAceO0WdPEmVzovFnlJ4TR1
         /QDGM3Wy22mAY2pwTwveSgGeyfjt4o6mrwlSBcqUnYp1doMoLvtRKBbuIGTVJVnkwEUV
         EeCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716235903; x=1716840703;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9PM2o5jNXfuRUuP6TxEIEBudbQR4NtCgVAI1O+sTf7U=;
        b=Y27Lq6JjI6Qs/Yq4WrNV1+DpeBm4tf3mXR0/TA6jhTUE+voJeRG1d9az3w2QTFx5ne
         D0M4K7PYq1bA7iuLgpokjT5VCk9aflgshDRrhf8ZXx+iRLW84zpzchjxEuEHqTJeul5N
         +DZyCSiVRFXsLKLQGhwIWXpqFFsUXBeA8g5n6wbR3ebu/ZUmqNHpU7b51kdWgtueh0tr
         tfnJq6bpufxajFWfXhZHsI4H/aJBYpJntFUg/rJIx3obySLNdhuh0ki0dr+KVZDCWY+6
         y72Z1BlqvEy592PDThL+/UMQ/Ck0Ud/QUTen4DQiSep/nf+t0gTqXpQKEe6oKGeX2q32
         n/+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUvrKZsA8+CYKMbA33yRN301MrG0kPexdwrgV7zBTmKZukXhjCae6uDRhWXX5FOZA2ZiO4bwZ+qQZPXiHVVVPsbf+rHodIyvZLikxabUuG9
X-Gm-Message-State: AOJu0YzqHDUIzn98guJUobL8xj88aFkLMZwzCXiuYXX/T1GdGTiWWCNg
	F+PMnTsLqg2ZA1fzQtjxawzBrWWDYTx12KvSLBa8Ti4hnv7SBkpRy0xjM1pA1hU=
X-Google-Smtp-Source: AGHT+IFRZhmOYJwGAcLbXRL2uDIeayGTe8D9hUj1uP1w+nEBbftf22Y46efOclD6gUxBji0DKSfZog==
X-Received: by 2002:a05:6a20:3c90:b0:1ad:9394:2d30 with SMTP id adf61e73a8af0-1afde139a99mr33701775637.37.1716235902866;
        Mon, 20 May 2024 13:11:42 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2a9d94csm20112830b3a.95.2024.05.20.13.11.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 13:11:42 -0700 (PDT)
Date: Mon, 20 May 2024 13:11:39 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Jessica Clarke <jrtc27@jrtc27.com>
Cc: Conor Dooley <conor@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@sifive.com>,
	linux-riscv <linux-riscv@lists.infradead.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH 0/2] riscv: Allow vlenb to be probed from DT
Message-ID: <Zkuueyrdv3z5QfsR@ghost>
References: <20240515-add_vlenb_to_dt-v1-0-4ebd7cba0aa1@rivosinc.com>
 <A9EDD470-B8EC-4644-82A0-7444729EF885@jrtc27.com>
 <ZkVAYeNnvj99YHXt@ghost>
 <6DDF33DF-07D6-4230-8674-F91A91660686@jrtc27.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6DDF33DF-07D6-4230-8674-F91A91660686@jrtc27.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240520_131145_008282_0CE42FB5 
X-CRM114-Status: GOOD (  35.65  )
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

T24gVGh1LCBNYXkgMTYsIDIwMjQgYXQgMDE6NTg6MjlBTSArMDEwMCwgSmVzc2ljYSBDbGFya2Ug
d3JvdGU6Cj4gT24gMTYgTWF5IDIwMjQsIGF0IDAwOjA4LCBDaGFybGllIEplbmtpbnMgPGNoYXJs
aWVAcml2b3NpbmMuY29tPiB3cm90ZToKPiA+IAo+ID4gT24gV2VkLCBNYXkgMTUsIDIwMjQgYXQg
MTE6MjU6MTZQTSArMDEwMCwgSmVzc2ljYSBDbGFya2Ugd3JvdGU6Cj4gPj4gT24gMTUgTWF5IDIw
MjQsIGF0IDIyOjUwLCBDaGFybGllIEplbmtpbnMgPGNoYXJsaWVAcml2b3NpbmMuY29tPiB3cm90
ZToKPiA+Pj4gCj4gPj4+IFRoZSBrZXJuZWwgY3VycmVudGx5IHJlcXVpcmVzIGFsbCBoYXJ0cyB0
byBoYXZlIHRoZSBzYW1lIHZhbHVlIGluIHRoZQo+ID4+PiB2bGVuYiBjc3IgdGhhdCBpcyBwcmVz
ZW50IHdoZW4gYSBoYXJ0IHN1cHBvcnRzIHZlY3Rvci4gSW4gb3JkZXIgdG8gcmVhZAo+ID4+PiB0
aGlzIGNzciwgdGhlIGtlcm5lbCBuZWVkcyB0byBib290IHRoZSBoYXJ0LiBBZGRpbmcgdmxlbmIg
dG8gdGhlIERUIHdpbGwKPiA+Pj4gYWxsb3cgdGhlIGtlcm5lbCB0byBkZXRlY3QgdGhlIGluY29u
c2lzdGVuY3kgZWFybHkgYW5kIG5vdCB3YXN0ZSB0aW1lCj4gPj4+IHRyeWluZyB0byBib290IGhh
cnRzIHRoYXQgaXQgZG9lc24ndCBzdXBwb3J0Lgo+ID4+IAo+ID4+IFRoYXQgZG9lc27igJl0IHNl
ZW0gc3VmZmljaWVudCBqdXN0aWZpY2F0aW9uIHRvIG1lLiBJZiBpdCBjYW4gYmUgcmVhZAo+ID4+
IGZyb20gdGhlIGhhcmR3YXJlLCB3aHkgc2hvdWxkIHdlIGhhdmUgdG8gcHV0IGl0IGluIHRoZSBG
RFQ/IFRoZSB3aG9sZQo+ID4+IHBvaW50IG9mIHRoZSBGRFQgaXMgdG8gY29tbXVuaWNhdGUgdGhl
IGhhcmR3YXJlIGNvbmZpZ3VyYXRpb24gdGhhdAo+ID4+IGlzbuKAmXQgb3RoZXJ3aXNlIGRpc2Nv
dmVyYWJsZS4KPiA+IAo+ID4gWWVzIHlvdSBhcmUgY29ycmVjdCBpbiB0aGF0IHZsZW5iIGlzIGRp
c2NvdmVyYWJsZSBvbiBhbnkgY29uZm9ybWluZwo+ID4gY2hpcC4gSG93ZXZlciwgdGhlIG1vdGl2
YXRpb24gaGVyZSBpcyBmb3IgbWFraW5nIGRlY2lzaW9ucyBhYm91dCBob3cgdG8KPiA+IGJvb3Qg
YSBoYXJ0IGJlZm9yZSBpdCBpcyBib290ZWQuIEJ5IHBsYWNpbmcgaXQgaW4gdGhlIGRldmljZSB0
cmVlLCB3ZQo+ID4gYXJlIGFibGUgdG8gZGlzYWJsZSB2ZWN0b3IgYmVmb3JlIHRoZSBjaGlwIGlz
IGJvb3RlZCBpbnN0ZWFkIG9mIHRyeWluZwo+ID4gdG8gYm9vdCB0aGUgY2hpcCB3aXRoIHZlY3Rv
ciBlbmFibGVkIG9ubHkgdG8gZGlzYWJsZSBpdCBsYXRlci4gSW4gYm90aAo+ID4gY2FzZXMgd2hl
biB0aGVyZSBpcyBkaWZmZXJlbnQgdmxlbmIgb24gZGlmZmVyZW50IGhhcnRzLCBhbGwgaGFydHMg
c3RpbGwKPiA+IGJvb3QgYW5kIHRoZSBvdXRjb21lIGlzIHRoYXQgdmVjdG9yIGlzIGRpc2FibGVk
LiBUaGUgZGlmZmVyZW5jZSBpcyB0aGF0Cj4gPiB3aXRoIHRoZSBEVCBlbnRyeSwgbm8gdmVjdG9y
IHNldHVwIGNvZGUgbmVlZHMgdG8gYmUgcmFuIG9uIGEgYm9vdGluZwo+ID4gaGFydCB3aGVuIHRo
ZSBvdXRjb21lIHdpbGwgYmUgdGhhdCB2ZWN0b3IgaXMgbm90IGVuYWJsZWQuCj4gCj4gV2h5IGRv
ZXMgdmxlbiBnZXQgdGhpcyBzcGVjaWFsIHRyZWF0bWVudD8gWW91IGNvdWxkIG1ha2UgZXhhY3Rs
eSB0aGUKPiBzYW1lIGFyZ3VtZW50IGZvciB0aGUgbnVtYmVyIG9mIGFzaWQgYml0cy4gVGhlIHBy
ZWNlZGVudCBpbiB0aGUga2VybmVsLAo+IHdoZXRoZXIgUklTQy1WIG9yIG90aGVyIGFyY2hpdGVj
dHVyZXMsIGlzIHRvIG5vdCBkbyB0aGlzLiBZb3UgY2FuCj4gZGV0ZWN0IGl0LCBzbyB5b3Ugc2hv
dWxkLCBlc3BlY2lhbGx5IHNpbmNlIG9wdGltaXNpbmcgZm9yIGFuCj4gZXhjZXB0aW9uYWwsIHVu
ZXhwZWN0ZWQgZXJyb3IgY2FzZSBpcyBub3Qgd29ydGh3aGlsZS4KPiAKPiA+PiBBcyBmb3IgVC1I
RUFEIHN0dWZmLCBpZiB0aGV5IG5lZWQgaXQgdGhleSBjYW4gaGF2ZSBhIGN1c3RvbSBwcm9wZXJ0
eS4KPiA+PiBUaG91Z2ggbmFpdmVseSBJ4oCZZCBhc3N1bWUgdGhlcmXigJlzIGEgd2F5IHRvIGF2
b2lkIGl0IHN0aWxsLi4uCj4gPiAKPiA+IFQtSGVhZCBkb2VzIG5vdCBleHBvc2UgdmxlbmIgb24g
YWxsIG9mIHRoZWlyIGNoaXBzIHNvIEkgZG8gbm90IGtub3cgb2YKPiA+IGFueSBvdGhlciB3YXkg
b2YgZ2V0dGluZyB0aGUgdmxlbmIgd2l0aG91dCBoYXZpbmcgaXQgYmUgcHJvdmlkZWQgaW4gYQo+
ID4gRFQuIFRoYXQgd2FzIHRoZSBtb3RpdmF0aW9uIGZvciB0aGlzIHBhdGNoIGluIHRoZSBmaXJz
dCBwbGFjZSwgYnV0Cj4gPiBtYWtpbmcgdGhpcyBhdmFpbGFibGUgdG8gYWxsIHZlbmRvcnMgYWxs
b3dzIG9wdGltaXphdGlvbnMgdG8gaGFwcGVuCj4gPiBkdXJpbmcgYm9vdC4KPiAKPiBIb3cgZG9l
cyB1c2Vyc3BhY2UgcmVhZCBpdCB0aGVuPyBCdXQgaWYgVC1IRUFEIG5lZWQgaXQsIHRoYXQgbWVh
bnMgaXQKPiBzaG91bGQgYmUgYSB0aGVhZCx2bGVuLCBub3QgYSByaXNjdix2bGVuLgo+IAo+IEpl
c3MKPiAKCkknbGwgbGV0IFBhbG1lciBkZWNpZGUgaWYgaXQgaXMgcmVhc29uYWJsZSB0byBoYXZl
IHZsZW5iIGFsbG93ZWQgdG8gYmUKcGxhY2VkIGluIHRoZSBkZXZpY2UgdHJlZSB0byBzdXBwb3J0
IGNvcmVzIGxpa2Ugb25lcyBtYWRlIGJ5IHRoZWFkIHdoaWNoCmRvbid0IHN1cHBvcnQgdmxlbmIu
IE90aGVyd2lzZSBJIHdpbGwgcmVwbGFjZSBpdCB3aXRoIGEgdGhlYWQtc3BlY2lmaWMKYmluZGlu
Zy4gCgotIENoYXJsaWUKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
