Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E243C531F9
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Jul 2026 13:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tMUxggPLLV6s7nqV8R3fdeHvk86Cp7+ThEgh4f6tzWY=; b=MBnFitmBtXDDiV
	Q/u4uRROCaTJqBODeHke7RixwOgxeyOStCVXnKsAWoRKPYhj4e6Vo88i3kZ7ZyGK8PeuBmxSUr143
	oo+5LaduDNKR5Vho2QAU4n4dzP0GmVakJIfZ1uxaXCJfszg6Qsw75Uix2reIrMfjg+ZpvF/3UcvuE
	7S9KDvhW3+4BXkL/yBlIB2E3XgOcEjMkRBj9AgdNHJQ0yMY1xhHkEzf/uT1JaLjRg8yowZVNlgkxz
	f7BTJ/lcQOkF0yE+L7sMkbcuTHio3oCQyTZFR3gnvbkwrYjnXLbbmjmRtRFchyQRW6lL6RVDWVaC5
	Dbf9q2t3MsV2/jIYV24A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnGIg-0000000GWU9-2Rky;
	Fri, 24 Jul 2026 13:50:54 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnGIc-0000000GWTW-3LF9
	for linux-riscv@lists.infradead.org;
	Fri, 24 Jul 2026 13:50:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784901047;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MwiZTPvXmJSRooyrMHMQvPW6/fjLCAsuJJahJtMR3K0=;
	b=VoZ0oVFYoczppPv46ev6UvAibJUhw6aOZDXlDtqfnYjuO+tFB1lHRxlL1fDmen5B9f22R0
	Q5P1F3aMCfCZfAi/U6PFN9ucR3Pi8E3xXaH1Ypuc3BwTVUItOzEqy9B4CIGyBGL5P8jTmu
	OO6SAM00lRfgs7UsCps1ovcxBnxXD6k=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-122-02sMillEMdClBP-rzfYfIg-1; Fri, 24 Jul 2026 09:50:44 -0400
X-MC-Unique: 02sMillEMdClBP-rzfYfIg-1
X-Mimecast-MFC-AGG-ID: 02sMillEMdClBP-rzfYfIg_1784901043
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-47eaa4006a1so257242f8f.0
        for <linux-riscv@lists.infradead.org>; Fri, 24 Jul 2026 06:50:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784901043; x=1785505843;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MwiZTPvXmJSRooyrMHMQvPW6/fjLCAsuJJahJtMR3K0=;
        b=MwOEMN14KblvsJGyjSUlM9t5zxUqo7trQI9/uDXK9LDygrOlOM5x+bRinUmEyWR8Ge
         y4rANUBibutS4y4NAXV/XdAmqJYK5aBTOh7u4exdjx9gm+7aLE6vXVrsI5AeME3oQuIq
         Ox7Vu52aqa6Zy1jd8P8s1mxbDGjRD26n3J5yqrYYLi1Qyo0LJlBcJaZ5uts8A9KvvSLJ
         FnQHmdD0dwbX/9Con81CrBHP2hKjbQOy9PN+s0xjRAMQHE622CHaM9QnDNDkmmUFtYI1
         MZlrJLmSEvgpf94gkRudFvYFiVC2FE/Z4hwa5NM+yBGASAByRE5gdRdGTg8r6PA6sttb
         RN5g==
X-Gm-Message-State: AOJu0Yw9wJezRtladtE4WL8WTNV4UackOS2Ep24fz8r/xH5uvOmmEugC
	NU+0JyZ4oXo+ZNzwSKbE80lTAASYG6LB/14etjUdSwEW0pDrZ9D3A0FWYx3L8JLO8WTn8Srn1z4
	CwHb8+gNZvtiaFZuS0ij1d8oA52zXbASbX1ehWVSRJXmMb9neOigTe65pcxnoqTD6uRHQfkNh3R
	qsC3FM9o7LyoJNLAVEv2hDfAUCk5RvKz7tlTrpHeYDMH4y
X-Gm-Gg: AR+sD128R1htxv3fnVqadpf+x1uSi6lObl41DMm3CWtsZFJPqhUW9jfIw/UFU/cOeVa
	PkJAskXlZIyFyJKKI+hWlzbcOLlcLL/N0oc7Rv8VuLvW6/+uluaY9CJghjg8iejM7w4DU7MuSDN
	I2cp0wWN+K42UNcgiCiYJAT5Lx6JP6Ljl/FYCEsnSWO+3txpxvHtqr9HB1LRhvZ1NnCz80WRj+j
	BHfbgGSYkwmTQ5Hcg==
X-Received: by 2002:a05:6000:2613:b0:47f:964f:870a with SMTP id ffacd0b85a97d-47f9d0f7e94mr788193f8f.27.1784901042938;
        Fri, 24 Jul 2026 06:50:42 -0700 (PDT)
X-Received: by 2002:a05:6000:2613:b0:47f:964f:870a with SMTP id
 ffacd0b85a97d-47f9d0f7e94mr788139f8f.27.1784901042479; Fri, 24 Jul 2026
 06:50:42 -0700 (PDT)
MIME-Version: 1.0
References: <20260723084841.2988456-1-himanshu.chauhan@oss.qualcomm.com>
In-Reply-To: <20260723084841.2988456-1-himanshu.chauhan@oss.qualcomm.com>
From: Jesse Taube <jtaubepe@redhat.com>
Date: Fri, 24 Jul 2026 09:50:30 -0400
X-Gm-Features: AUfX_mxUmQHBBc9KhnKqC8llAMXLKRD4cx4yF42LmIfX5QC_zIcbI67UmWF5hn4
Message-ID: <CADRr4bcoS6pFw8VQcNORJuOzOnD-MY4ggauzoiO6FqJ410f5ag@mail.gmail.com>
Subject: Re: [PATCH v5 0/3] riscv: Introduce support for hardware break/watchpoints
To: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Cc: linux-riscv@lists.infradead.org, qingfang.deng@linux.dev, alex@ghiti.fr, 
	aou@eecs.berkeley.edu, palmer@dabbelt.com, pjw@kernel.org, shuah@kernel.org, 
	linux-kernel@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: fEBttnhoFvWqHAuY-3K8zZEe4om1RblQG7bQfhkcpLU_1784901043
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_065051_203514_866B12F3 
X-CRM114-Status: GOOD (  27.36  )
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

T24gVGh1LCBKdWwgMjMsIDIwMjYgYXQgNDo0OeKAr0FNIEhpbWFuc2h1IENoYXVoYW4KPGhpbWFu
c2h1LmNoYXVoYW5Ab3NzLnF1YWxjb21tLmNvbT4gd3JvdGU6Cj4KPiBUaGlzIHBhdGNoc2V0IGFk
ZHMgc3VwcG9ydCBvZiBoYXJkd2FyZSBicmVha3BvaW50cyBhbmQgd2F0Y2hwb2ludHMgaW4gUklT
Qy1WCj4gYXJjaGl0ZWN0dXJlLiBUaGUgZnJhbWV3b3JrIGlzIGJ1aWx0IG9uIHRvcCBvZiBwZXJm
IHN1YnN5c3RlbSBhbmQgU0JJIGRlYnVnCj4gdHJpZ2dlciBleHRlbnNpb24uCgpIZWxsbywgaXRz
IG5pY2UgdG8gc2VlIHlvdSB3b3JraW5nIG9uIHRoaXMgcHJvamVjdCBhZ2FpbiwKY2FuIHlvdSBr
ZWVwIG1lIGFuZCBDaGFybGllIEplbmtpbnMgPHRoZWNoYXJsZXNqZW5raW5zQGdtYWlsLmNvbT4g
aW4gY2MgcGxlYXNlClRoaXMgc2V0IGRvZXNudCBzZWVtIHRvIGJlIGEgY29udGludWF0aW9uIG9u
IG15IHNldCwgYnV0IGRvZXMgaXQgcGFzcyB0aGUgdGVzdHMKaSB3cm90ZSB0aGVyZT8KT24gcGF0
Y2ggOCBpIHdyb3RlIHRoZSBjb21tZW50CiJUaGUgc2VsZnRlc3QgZmFpbHMgYXMgcmVnaXN0ZXJf
dXNlcl9od19icmVha3BvaW50IHNlZW1pbmdseSBkb2VzIG5vdApjYWxsIGFyY2hfaW5zdGFsbF9o
d19icmVha3BvaW50LiBUaGUgdGVzdCBhbHNvIHNlZW1zIHRvIGZhaWwgb24gYXJtNjQKaW4gdGhl
IHNhbWUgd2F5IHdoZW4gSSB0ZXN0ZWQgaXQuIgpodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwv
MjAyNTA4MjIxNzQ3MTUuMTI2OTEzOC05LWplc3NlQHJpdm9zaW5jLmNvbS8KaHR0cHM6Ly9wYXRj
aHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LXJpc2N2L2xpc3QvP3Nlcmllcz05OTQ3NTAm
c3RhdGU9KgoKVGhhbmtzLApKZXNzZSBUYXViZQoKPgo+IEN1cnJlbnRseSBmb2xsb3dpbmcgZmVh
dHVyZXMgYXJlIG5vdCBzdXBwb3J0ZWQgYW5kIGFyZSBpbiB3b3JrczoKPiAgLSBQdHJhY2Ugc3Vw
cG9ydAo+ICAtIFNpbmdsZSBzdGVwcGluZwo+ICAtIFZpcnR1YWxpemF0aW9uIG9mIGRlYnVnIHRy
aWdnZXJzCj4KPiBUaGUgU0JJIGRlYnVnIHRyaWdnZXIgZXh0ZW5zaW9uIHByb3Bvc2FsIGNhbiBi
ZSBmb3VuZCBpbiBDaGFwdGVyLTE5IG9mIFNCSSBzcGVjaWZpY2F0aW9uOgo+IGh0dHBzOi8vZ2l0
aHViLmNvbS9yaXNjdi1ub24taXNhL3Jpc2N2LXNiaS1kb2MvcmVsZWFzZXMvZG93bmxvYWQvdjMu
MC9yaXNjdi1zYmkucGRmCj4KPiBUaGUgU2R0cmlnIElTQSBpcyBwYXJ0IG9mIFJJU0MtViBkZWJ1
ZyBzcGVjaWZpY2F0aW9uIHdoaWNoIGNhbiBiZSBmb3VuZCBhdDoKPiBodHRwczovL2dpdGh1Yi5j
b20vcmlzY3YvcmlzY3YtZGVidWctc3BlYwo+Cj4gQ2hhbmdlcyBmcm9tIHY0Ogo+ICAgICAgICAg
LSBSZWJhc2VkIHRvIHY3LjItcmM0Cj4gICAgICAgICAtIEZpeGVkIHJ2MzIgYnVpbGQgZXJyb3IK
PiAgICAgICAgIC0gQWRkZWQgcHJfZm10IHRvIHByaW50IEtCVUlMRF9NT0ROQU1FCj4gICAgICAg
ICAtIENoYW5nZWQgdHlwZSBvZiBzaG1lbV9wYSB0byBwaHlzX2FkZHJfdAo+ICAgICAgICAgLSBV
c2UgcGVyX2NwdV9wdHJfdG9fcGh5cyBpbnN0ZWFkIG9mIF9fcGEgcGVyLWNwdSBhbGxvY2F0ZWQg
bWVtCj4gICAgICAgICAtIFByaW50IHN1Y2Nlc3NmdWwgcmVnaXN0cmF0aW9uL3VucmVnaXN0cmF0
aW9uIG1lc3NhZ2Ugd2hlbiBubyBlcnJvcgo+ICAgICAgICAgLSBBZGRlZCBSSVNDLVYgREVCVUdH
SU5HIHNlY3Rpb24gaW4gTUFJTlRBSU5FUiBmaWxlIGFuZCBhZGRlZCBteXNlbGYgYXMgbWFpbnRh
aW5lcgo+ICAgICAgICAgLSBGaXhlZCBjcmF3bGVkIGluIHdhcm5pbmdzIGZyb20gY2hlY2twYXRj
aC5wbCAtLXN0cmljdCBydW4KPgo+IENoYW5nZXMgZnJvbSB2MzoKPiAgICAgICAgIC0gUmViYXNl
ZCB0byB2Ny4xLXJjMy4KPiAgICAgICAgIC0gRm9yIHdhdGNocG9pbnRzLCBjaGVjayB0ZGF0YTEu
aGl0IHZpYSBTQklfRVhUX0RCVFJfVFJJR19SRUFEIGFuZAo+ICAgICAgICAgICBrZWVwIFNUVkFM
LWJhc2VkIG1hdGNoaW5nIGFzIGZhbGxiYWNrLgo+ICAgICAgICAgLSBJbXByb3ZlZCB3YXRjaHBv
aW50IG1hdGNoaW5nIHdoZW4gU1RWQUwgcmVwb3J0cyB0aGUgbG93ZXN0IGFjY2Vzc2VkCj4gICAg
ICAgICAgIGFkZHJlc3MgZm9yIHdpZGVyIG1lbW9yeSBhY2Nlc3Nlcy4KPiAgICAgICAgIC0gUHJv
Z3JhbSBleGVjdXRlIGJyZWFrcG9pbnRzIHdpdGggU0laRT0wIChtYXRjaCBhbnkgc2l6ZSkgdG8g
YXZvaWQKPiAgICAgICAgICAgbWlzc2VzIHdpdGggMTYtYml0L2NvbXByZXNzZWQgaW5zdHJ1Y3Rp
b24gYWRkcmVzc2VzLgo+ICAgICAgICAgLSBVcGRhdGVkIFJJU0NWIHNlbGZ0ZXN0IHRvIGF2b2lk
IGRlYWRsb2NrIGJ5IHJlcGxhY2luZyB1bmJvdW5kZWQKPiAgICAgICAgICAgc2VtX3dhaXQoKSB3
aXRoIHNlbV90aW1lZHdhaXQoKSB0aW1lb3V0IGhhbmRsaW5nLgo+ICAgICAgICAgLSBVcGRhdGVk
IFJJU0NWIHNlbGZ0ZXN0IGJyZWFrcG9pbnQgZnVuY3Rpb24gc28gaXQgY2Fubm90IGJlIGlubGlu
ZWQKPiAgICAgICAgICAgb3Igb3B0aW1pemVkIGF3YXkuCj4KPiBDaGFuZ2VzIGZyb20gdjI6Cj4g
ICAgICAgICAtIFJlYmFzZWQgdG8gdjcuMC1yYzEKPiAgICAgICAgIC0gRml4ZWQgdGhlIHdhcm5p
bmdzIGZyb20gYGNoZWNrcGF0Y2gucGwgLS1zdHJpY3RgIHJ1bi4KPgo+IENoYW5nZXMgZnJvbSB2
MToKPiAgICAgICAgIC0gVGhlIHBhdGNoIHRoYXQgYWRkcyB0aGUgZXh0ZW5zaW9uIGFuZCB0aGUg
ZnVuY3Rpb24gSURzIGRlZmluZWQgYnkgdGhlIGV4dGVuc2lvbiBpcwo+ICAgICAgICAgICBhbHJl
YWR5IG1lcmdlZC4gU28gdGhpcyBwYXRjaCBidWlsZHMgb24gdG9wIG9mIHRoYXQuCj4gICAgICAg
ICAtIEFkZGVkIGJyZWFrcG9pbnQgdGVzdCBhcHBsaWNhdGlvbiBpbiBzZWxmIHRlc3RzIHRvIHRl
c3QgZGVidWcgdHJpZ2dlcnMKPgo+IEhvdyB0byB1c2U6Cj4gfn5+fn5+fn5+fn4KPiBPcGVuU0JJ
Ogo+IGh0dHBzOi8vZ2l0aHViLmNvbS9yaXNjdi1zb2Z0d2FyZS1zcmMvb3BlbnNiaS5naXQKPgo+
IFFlbXU6Cj4gaHR0cHM6Ly9naXRodWIuY29tL3FlbXUvcWVtdS5naXQKPgo+IExpbnV4IEtlcm5l
bDoKPiBZb3UgY2FuIHB1bGwgdjcuMi1yYzQgdGFnIGZyb20gTGludXMnIFRyZWUgYW5kIGFwcGx5
IHRoZXNlIHBhdGNoZXMuCj4KPiBIb3cgdG8gdGVzdDoKPiB+fn5+fn5+fn5+fgo+IEZyb20gdGhl
IExpbnV4IGtlcm5lbCBkaXJlY3RvcnkgaXNzdWUgdGhlIGZvbGxvd2luZyBjb21tYW5kOgo+IG1h
a2UgLUMgdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvYnJlYWtwb2ludHMvCj4KPiBUaGlzIHdpbGwg
bWFrZSBhIGJpbmFyeSBuYW1lZCBicmVha3BvaW50X3Rlc3RfcmlzY3YgdW5kZXIgdGhlIHNhbWUg
ZGlyZWN0b3J5Lgo+IExvYWQgaXQgb24gdGhlIG1hY2hpbmUgYW5kIHJ1bi4gU2FtcGxlIG91dHB1
dCBpcyBnaXZlbiBiZWxvdzoKPgo+IC8gIyAvYXBwcy9icmVha3BvaW50X3Rlc3RfcmlzY3YKPiBC
cmVha3BvaW50IHRyaWdnZXJlZCEKPiBCcmVha3BvaW50IHRlc3QgcGFzc2VkIQo+IFdhdGNocG9p
bnQgdHJpZ2dlcmVkIQo+IFdhdGNocG9pbnQgdGVzdCBwYXNzZWQhCj4KPiBIaW1hbnNodSBDaGF1
aGFuICgzKToKPiAgIHJpc2N2OiBJbnRyb2R1Y2Ugc3VwcG9ydCBmb3IgaGFyZHdhcmUgYnJlYWsv
d2F0Y2hwb2ludHMKPiAgIHJpc2N2OiBBZGQgYnJlYWtwb2ludCBhbmQgd2F0Y2hwb2ludCB0ZXN0
IGZvciByaXNjdgo+ICAgTUFJTlRBSU5FUlM6IEFkZCBlbnRyeSBmb3IgUklTQy1WIERlYnVnZ2lu
Zwo+Cj4gIE1BSU5UQUlORVJTICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAg
OSArCj4gIGFyY2gvcmlzY3YvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAg
MSArCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdfYnJlYWtwb2ludC5oICAgICAgICB8IDMz
NyArKysrKysrKwo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2tkZWJ1Zy5oICAgICAgICAgICAg
ICAgfCAgIDMgKy0KPiAgYXJjaC9yaXNjdi9rZXJuZWwvTWFrZWZpbGUgICAgICAgICAgICAgICAg
ICAgIHwgICAxICsKPiAgYXJjaC9yaXNjdi9rZXJuZWwvaHdfYnJlYWtwb2ludC5jICAgICAgICAg
ICAgIHwgNzM4ICsrKysrKysrKysrKysrKysrKwo+ICBhcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5j
ICAgICAgICAgICAgICAgICAgICAgfCAgIDYgKwo+ICB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9i
cmVha3BvaW50cy9NYWtlZmlsZSAgfCAgIDUgKwo+ICAuLi4vYnJlYWtwb2ludHMvYnJlYWtwb2lu
dF90ZXN0X3Jpc2N2LmMgICAgICAgfCAyMTQgKysrKysKPiAgOSBmaWxlcyBjaGFuZ2VkLCAxMzEz
IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gv
cmlzY3YvaW5jbHVkZS9hc20vaHdfYnJlYWtwb2ludC5oCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBh
cmNoL3Jpc2N2L2tlcm5lbC9od19icmVha3BvaW50LmMKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHRv
b2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2JyZWFrcG9pbnRzL2JyZWFrcG9pbnRfdGVzdF9yaXNjdi5j
Cj4KPiAtLQo+IDIuNDMuMAo+Cj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwo+IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+IGxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cj4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
