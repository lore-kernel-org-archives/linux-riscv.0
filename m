Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 731B2E77188
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jan 2025 09:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6+EIMqdBsg84R0Op8bJuraxrmii/BLoPl2qJZjziKgU=; b=zmkrHJ2hJU1LaL
	npcvWEFRD34KSun86W9SweNBBIMsvW/xgmTuQeiiG1cQkdeUHQ3RlwEa5wsbwgA39FjkAKg1lm8q0
	TVmHui06tLeAtT62Yw2FGuHRom+91Tc7TjmZ8465Sl3iUv6gATBtK5Vsma89DX/h4QpWcD+GFvluz
	1Lb1UgmAeaN66t2pS0d7j71+AKmXfXPVHtPvmrZr55JfoGdi6lJb6SDSHkyGjbq8Q4xR4hWwcOkUX
	P6UnABEBJO1udVKWOqwwPNpQxOQd1d0cYZTELDsnFLwNQGfDQ5IjtYqkjZVItd3mpU1Zvyq48z4nC
	BrXIhK3t/15Mbnht/TKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUjWv-00000000iJL-25Da;
	Mon, 06 Jan 2025 09:36:13 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUjWs-00000000iIS-0l9s
	for linux-riscv@lists.infradead.org;
	Mon, 06 Jan 2025 09:36:11 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2164b662090so176887985ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 06 Jan 2025 01:36:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1736156169; x=1736760969; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Wj5KkPcC13AnXUqS3utkLeMnI53ntVRUgTAJ7aqMxq8=;
        b=PSWl03zO71Ycamrk/CZ0A6GxeOYgjw5ucdDLtLN2pGLlEiCS4qyBzbGkdpAk/8DHui
         /ZVDdWH8eAG61Rk4xKLhne9u2kUBZcX+NM/mLqBYhTkTZXGq908j/q2JLswrdia79FVF
         ZJ1h/MqjSoju5hWIuTz9I77bp4cfrknNpLZfvRCOcKrHmrssbCB2kd8cjAmOuEmAlGoz
         K3SHK/Qf9R3MO23jAwxb79Wtx3pvyQNKb6/uFShsmEk4o55w0PCwlIiRGAqiJWk+KeK1
         YifB3kQnvNkNgPeMVAsGaiaXmfAfxOICmI10A88Yi6vqKQlTOWCro0LAPNKyNinCfPb0
         J3Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736156169; x=1736760969;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wj5KkPcC13AnXUqS3utkLeMnI53ntVRUgTAJ7aqMxq8=;
        b=Gr5y1wL3Yu14Y/ErIU4wKv8lET3hAW8A3Uy4oyH7ffTFzZv8k+sv88f5FHCfvEJfrd
         F7IrgauW0xctCe5P5tXqtYB4sAt8ELy+WJPu3/4pEXrr5koaS4lUwvOw1KKzWCL7aTh7
         JYVSKcAgEijrDeqfk78ftfzFr1qvDPqt+GWxG0HprsklWlxg9QakvGEObyDLqQQF070c
         HYdI8JyHwr36TE2kRZ34xKTBWgah5JQx9z/3CSyFHlUkVKzgyMHkPLhfpVhEf3Mn75nB
         L5kd9bOLFsdZD46T4esnhkzw0woNGrh+buPVmEVZQHyrSs3m6nuZ2vzBikGoh0Mp2DiJ
         GO4g==
X-Forwarded-Encrypted: i=1; AJvYcCXZW3m/vuThFRe7X3JNfiBji6mazqOf+RIkUuFfXY/HPyKcYKwOutUkdyEFJbC1Lkzwb1uUZPFXS5mQaA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzIU+TMGemv40aQGhSGCR4996ULGDseh+QTMAFi7fSerQyXCFGh
	gUa4qWA//gY+lpzPMB3EmwU/yonQ2OgTeZCMmL3SeqLnJNCZ62MguWquHKK9S/hgr76oFpHrSmr
	b
X-Gm-Gg: ASbGncvYnrBFftPGHVga6sXhfY6JvDDTNN3Cn8/pvtlY+IXJzP1afJjfGrGUx1YqnvE
	6XeE4vmcHrEU/SytX7fbCqgFVnFgWCgKiNTuq61Dtl7PBOddILuufm62F6P/alovO9hHJOuDbiv
	MNiTeJ0RDgzgMLTpaBFBqMuuEry7jX3gFqn4djbOhu4My58Xr3Y4xjhEOJDAGbOOWwGD9Tf+MGK
	NHnELoWFoaNfwNZ2vtPGrSSA5k45jBDBabpyeipwQ3H1xiErC/aPvivh5ca2hHMT/lwj0aDbX7+
	qYijBJ+NCDAVzr7TfkIvcdlsQA==
X-Google-Smtp-Source: AGHT+IFky4reNPfrRJJX+sf8zAAsb/oxJWzjmHQmw4ledcTWs/2wF66vpIK3VNKQoNhfcvyK1o9A1g==
X-Received: by 2002:a17:903:24e:b0:216:7761:cc49 with SMTP id d9443c01a7336-219e6f26251mr840416305ad.47.1736156168852;
        Mon, 06 Jan 2025 01:36:08 -0800 (PST)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9f726bsm288201565ad.220.2025.01.06.01.36.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jan 2025 01:36:07 -0800 (PST)
Message-ID: <4f78a39a-0788-49a4-9d63-777bb9d15b30@rivosinc.com>
Date: Mon, 6 Jan 2025 10:35:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: use local label names instead of global ones in
 assembly
To: Alexandre Ghiti <alex@ghiti.fr>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
References: <20250103141814.508865-1-cleger@rivosinc.com>
 <1fad8701-9667-487f-b356-45c6d07eeb49@ghiti.fr>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <1fad8701-9667-487f-b356-45c6d07eeb49@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_013610_487963_A1DD21E1 
X-CRM114-Status: GOOD (  17.45  )
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

CgpPbiAwNi8wMS8yMDI1IDA5OjUyLCBBbGV4YW5kcmUgR2hpdGkgd3JvdGU6Cj4gSGkgQ2zDqW1l
bnQsCj4gCj4gT24gMDMvMDEvMjAyNSAxNToxNywgQ2zDqW1lbnQgTMOpZ2VyIHdyb3RlOgo+PiBM
b2NhbCBsYWJlbHMgc2hvdWxkIGJlIHByZWZpeCBieSAnLkwnIG9yIHRoZXknbGwgYmUgZXhwb3J0
ZWQgaW4gdGhlCj4+IHN5bWJvbCB0YWJsZS4gQWRkaXRpb25hbGx5LCB0aGlzIG1lc3NlcyB1cCB0
aGUgYmFja3RyYWNlIGJ5IGRpc3BsYXlpbmcKPj4gYW4gaW5jb3JyZWN0IHN5bWJvbDoKPj4KPj4g
wqDCoCAuLi4KPj4gwqDCoCBbwqDCoCAxMi43NTE4MTBdIFs8ZmZmZmZmZmY4MDQ0MTYyOD5dIF9j
b3B5X2Zyb21fdXNlcisweDI4LzB4YzIKPj4gwqDCoCBbwqDCoCAxMi43NTIwMzVdIFs8ZmZmZmZm
ZmY4MDAxNTJjYT5dIGhhbmRsZV9taXNhbGlnbmVkX2xvYWQrMHgxY2EvMHgyZmMKPj4gwqDCoCBb
wqDCoCAxMi43NTIzMTBdIFs8ZmZmZmZmZmY4MGEwMzNlOD5dIGRvX3RyYXBfbG9hZF9taXNhbGln
bmVkKzB4MjQvMHhlZQo+PiDCoMKgIFvCoMKgIDEyLjc1MjU5Nl0gWzxmZmZmZmZmZjgwYTBkY2Fl
Pl0KPj4gX25ld192bWFsbG9jX3Jlc3RvcmVfY29udGV4dF9hMCsweGMyLzB4Y2UKPiAKPiAKPiBZ
ZXMsIEkgbm90aWNlZCB0aGlzIGxhc3Qgd2VlaywgdGhhbmtzIGZvciBsb29raW5nIGludG8gaXQu
IEkgd291bGQgYWRkIGEKPiBGaXhlcyB0YWcgYW5kIG1lcmdlIHRoYXQgaW4gdGhlIG5leHQgLXJj
IGlmIHBvc3NpYmxlIGFzIHRoZSBhYm92ZQo+IGJhY2t0cmFjZSBpcyAiZGlzdHVyYmluZyIuCgpI
aSBBbGV4LAoKWWVhaCwgSSB0aG91Z2h0IHRoZSBGaXhlcyB0YWcsIGJ1dCBzaW5jZSBpdCB3YXNu
J3QgcmVhbGx5ICJicmVha2luZyIKYW55dGhpbmcsIEkgbGVmdCBpdCBvdXQuIEknbGwgYWRkIGl0
IGFuZCBzZW50IGEgVjIuCgpUaGFua3MKCkNsw6ltZW50Cgo+IAo+IAo+Pgo+PiBBZnRlcjoKPj4g
wqDCoCAuLi4KPj4gwqDCoCBbwqDCoCAxMC4yNDM5MTZdIFs8ZmZmZmZmZmY4MDQ0MTVlND5dIF9j
b3B5X2Zyb21fdXNlcisweDI4LzB4YzIKPj4gwqDCoCBbwqDCoCAxMC4yNDQwMjZdIFs8ZmZmZmZm
ZmY4MDAxNTJjYT5dIGhhbmRsZV9taXNhbGlnbmVkX2xvYWQrMHgxY2EvMHgyZmMKPj4gwqDCoCBb
wqDCoCAxMC4yNDQxNTBdIFs8ZmZmZmZmZmY4MGEwMzNhMD5dIGRvX3RyYXBfbG9hZF9taXNhbGln
bmVkKzB4MjQvMHhlZQo+PiDCoMKgIFvCoMKgIDEwLjI0NDI2OF0gWzxmZmZmZmZmZjgwYTBkYzY2
Pl0gaGFuZGxlX2V4Y2VwdGlvbisweDE0Ni8weDE1Mgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBDbMOp
bWVudCBMw6lnZXIgPGNsZWdlckByaXZvc2luYy5jb20+Cj4+Cj4+IC0tLQo+PiDCoCBhcmNoL3Jp
c2N2L2tlcm5lbC9lbnRyeS5TIHwgMjAgKysrKysrKysrKy0tLS0tLS0tLS0KPj4gwqAgMSBmaWxl
IGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0t
Z2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvZW50cnkuUyBiL2FyY2gvcmlzY3Yva2VybmVsL2VudHJ5
LlMKPj4gaW5kZXggYzIwMGQzMjlkNGJkLi4yMTY1ODE4MzVlYjAgMTAwNjQ0Cj4+IC0tLSBhL2Fy
Y2gvcmlzY3Yva2VybmVsL2VudHJ5LlMKPj4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvZW50cnku
Uwo+PiBAQCAtMjMsMjEgKzIzLDIxIEBACj4+IMKgwqDCoMKgwqAgUkVHX1PCoMKgwqDCoCBhMCwg
VEFTS19USV9BMCh0cCkKPj4gwqDCoMKgwqDCoCBjc3JywqDCoMKgwqAgYTAsIENTUl9DQVVTRQo+
PiDCoMKgwqDCoMKgIC8qIEV4Y2x1ZGUgSVJRcyAqLwo+PiAtwqDCoMKgIGJsdMKgwqDCoMKgwqAg
YTAsIHplcm8sIF9uZXdfdm1hbGxvY19yZXN0b3JlX2NvbnRleHRfYTAKPj4gK8KgwqDCoCBibHTC
oMKgwqDCoMKgIGEwLCB6ZXJvLCAuTG5ld192bWFsbG9jX3Jlc3RvcmVfY29udGV4dF9hMAo+PiDC
oCDCoMKgwqDCoMKgIFJFR19TwqDCoMKgwqAgYTEsIFRBU0tfVElfQTEodHApCj4+IMKgwqDCoMKg
wqAgLyogT25seSBjaGVjayBuZXdfdm1hbGxvYyBpZiB3ZSBhcmUgaW4gcGFnZS9wcm90ZWN0aW9u
IGZhdWx0ICovCj4+IMKgwqDCoMKgwqAgbGnCoMKgwqDCoMKgwqAgYTEsIEVYQ19MT0FEX1BBR0Vf
RkFVTFQKPj4gLcKgwqDCoCBiZXHCoMKgwqDCoMKgIGEwLCBhMSwgX25ld192bWFsbG9jX2tlcm5l
bF9hZGRyZXNzCj4+ICvCoMKgwqAgYmVxwqDCoMKgwqDCoCBhMCwgYTEsIC5MbmV3X3ZtYWxsb2Nf
a2VybmVsX2FkZHJlc3MKPj4gwqDCoMKgwqDCoCBsacKgwqDCoMKgwqDCoCBhMSwgRVhDX1NUT1JF
X1BBR0VfRkFVTFQKPj4gLcKgwqDCoCBiZXHCoMKgwqDCoMKgIGEwLCBhMSwgX25ld192bWFsbG9j
X2tlcm5lbF9hZGRyZXNzCj4+ICvCoMKgwqAgYmVxwqDCoMKgwqDCoCBhMCwgYTEsIC5MbmV3X3Zt
YWxsb2Nfa2VybmVsX2FkZHJlc3MKPj4gwqDCoMKgwqDCoCBsacKgwqDCoMKgwqDCoCBhMSwgRVhD
X0lOU1RfUEFHRV9GQVVMVAo+PiAtwqDCoMKgIGJuZcKgwqDCoMKgwqAgYTAsIGExLCBfbmV3X3Zt
YWxsb2NfcmVzdG9yZV9jb250ZXh0X2ExCj4+ICvCoMKgwqAgYm5lwqDCoMKgwqDCoCBhMCwgYTEs
IC5MbmV3X3ZtYWxsb2NfcmVzdG9yZV9jb250ZXh0X2ExCj4+IMKgIC1fbmV3X3ZtYWxsb2Nfa2Vy
bmVsX2FkZHJlc3M6Cj4+ICsuTG5ld192bWFsbG9jX2tlcm5lbF9hZGRyZXNzOgo+PiDCoMKgwqDC
oMKgIC8qIElzIGl0IGEga2VybmVsIGFkZHJlc3M/ICovCj4+IMKgwqDCoMKgwqAgY3NycsKgwqDC
oMKgIGEwLCBDU1JfVFZBTAo+PiAtwqDCoMKgIGJnZcKgwqDCoMKgIGEwLCB6ZXJvLCBfbmV3X3Zt
YWxsb2NfcmVzdG9yZV9jb250ZXh0X2ExCj4+ICvCoMKgwqAgYmdlwqDCoMKgwqAgYTAsIHplcm8s
IC5MbmV3X3ZtYWxsb2NfcmVzdG9yZV9jb250ZXh0X2ExCj4+IMKgIMKgwqDCoMKgwqAgLyogQ2hl
Y2sgaWYgYSBuZXcgdm1hbGxvYyBtYXBwaW5nIGFwcGVhcmVkIHRoYXQgY291bGQgZXhwbGFpbgo+
PiB0aGUgdHJhcCAqLwo+PiDCoMKgwqDCoMKgIFJFR19TwqDCoMKgIGEyLCBUQVNLX1RJX0EyKHRw
KQo+PiBAQCAtNjksNyArNjksNyBAQCBfbmV3X3ZtYWxsb2Nfa2VybmVsX2FkZHJlc3M6Cj4+IMKg
wqDCoMKgwqAgLyogQ2hlY2sgdGhlIHZhbHVlIG9mIG5ld192bWFsbG9jIGZvciB0aGlzIGNwdSAq
Lwo+PiDCoMKgwqDCoMKgIFJFR19MwqDCoMKgIGEyLCAwKGEwKQo+PiDCoMKgwqDCoMKgIGFuZMKg
wqDCoCBhMiwgYTIsIGExCj4+IC3CoMKgwqAgYmVxwqDCoMKgIGEyLCB6ZXJvLCBfbmV3X3ZtYWxs
b2NfcmVzdG9yZV9jb250ZXh0Cj4+ICvCoMKgwqAgYmVxwqDCoMKgIGEyLCB6ZXJvLCAuTG5ld192
bWFsbG9jX3Jlc3RvcmVfY29udGV4dAo+PiDCoCDCoMKgwqDCoMKgIC8qIEF0b21pY2FsbHkgcmVz
ZXQgdGhlIGN1cnJlbnQgY3B1IGJpdCBpbiBuZXdfdm1hbGxvYyAqLwo+PiDCoMKgwqDCoMKgIGFt
b3hvci5kwqDCoMKgIGEwLCBhMSwgKGEwKQo+PiBAQCAtODMsMTEgKzgzLDExIEBAIF9uZXdfdm1h
bGxvY19rZXJuZWxfYWRkcmVzczoKPj4gwqDCoMKgwqDCoCBjc3J3wqDCoMKgIENTUl9TQ1JBVENI
LCB4MAo+PiDCoMKgwqDCoMKgIHNyZXQKPj4gwqAgLV9uZXdfdm1hbGxvY19yZXN0b3JlX2NvbnRl
eHQ6Cj4+ICsuTG5ld192bWFsbG9jX3Jlc3RvcmVfY29udGV4dDoKPj4gwqDCoMKgwqDCoCBSRUdf
TMKgwqDCoMKgIGEyLCBUQVNLX1RJX0EyKHRwKQo+PiAtX25ld192bWFsbG9jX3Jlc3RvcmVfY29u
dGV4dF9hMToKPj4gKy5MbmV3X3ZtYWxsb2NfcmVzdG9yZV9jb250ZXh0X2ExOgo+PiDCoMKgwqDC
oMKgIFJFR19MwqDCoMKgwqAgYTEsIFRBU0tfVElfQTEodHApCj4+IC1fbmV3X3ZtYWxsb2NfcmVz
dG9yZV9jb250ZXh0X2EwOgo+PiArLkxuZXdfdm1hbGxvY19yZXN0b3JlX2NvbnRleHRfYTA6Cj4+
IMKgwqDCoMKgwqAgUkVHX0zCoMKgwqAgYTAsIFRBU0tfVElfQTAodHApCj4+IMKgIC5lbmRtCj4+
IMKgIAo+IAo+IAo+IFlvdSBjYW4gYWRkOgo+IAo+IFJldmlld2VkLWJ5OiBBbGV4YW5kcmUgR2hp
dGkgPGFsZXhnaGl0aUByaXZvc2luYy5jb20+Cj4gCj4gVGhhbmtzLAo+IAo+IEFsZXgKPiAKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
