From: greg@kroah.com (Greg KH)
Date: Fri, 7 Sep 2018 07:47:24 +0200
Subject: rcu: Make expedited GPs handle CPU 0 being offline
In-Reply-To: <20180907034530.GA18753@linux.vnet.ibm.com>
References: <20180907034530.GA18753@linux.vnet.ibm.com>
Message-ID: <20180907054724.GA10955@kroah.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Thu, Sep 06, 2018 at 08:45:30PM -0700, Paul E. McKenney wrote:
> Hello!
> 
> Please apply the following commit to the v4.18 -stable tree:
> 
> 	rcu: Make expedited GPs handle CPU 0 being offline
> 	fcc63543650150629c8a873cbef3578770acecd9
> 
> This patch fixes a v4.18 regression that is causing the RISC-V people
> (CCed) some trouble.  It is a small patch and has been tested in the
> failing situation running v4.18 by Atish Patra and Andreas Schwab
> (both CCed).
> 
> Please let me know if more information is required.

Now applied, thanks.

greg k-h
